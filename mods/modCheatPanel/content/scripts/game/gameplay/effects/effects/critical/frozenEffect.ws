/***********************************************************************/
/** 	© 2015 CD PROJEKT S.A. All rights reserved.
/** 	THE WITCHER© is a trademark of CD PROJEKT S. A.
/** 	The Witcher game is based on the prose of Andrzej Sapkowski. 
/***********************************************************************/
class W3FrozenEffectCustomParams extends W3BuffCustomParams
{
	var freezeFadeInTime : float;		
}

class W3Effect_Frozen extends W3ImmobilizeEffect
{
	private saved var killOnHit : bool;
	private var bonusDamagePercents : float;
	private saved var targetWasFlying : bool;
	private var pushPriority : EInteractionPriority;
	private var wasKnockedDown : bool;

		default effectType = EET_Frozen;
		default resistStat = CDS_FrostRes;
		default criticalStateType = ECST_Frozen;
		default isDestroyedOnInterrupt = false;
		default killOnHit = false;

	protected function CalculateDuration(optional setInitialDuration : bool)
	{
		var customDur : float;
		customDur = ModCheats_GetFreezeDuration();
		if ( customDur > 0 )
		{
			duration = customDur;
			initialDuration = customDur;
			timeLeft = customDur;
		}
		else
		{
			duration = 6.0f;
			initialDuration = 6.0f;
			timeLeft = 6.0f;
		}
	}

	public function GetBuffResist() : float
	{
		return 0.0f;
	}
	
	event OnEffectAdded(optional customParams : W3BuffCustomParams)
	{
		var params : W3FrozenEffectCustomParams;
		var	animatedComponent 	: CAnimatedComponent;
		var mpac				: CMovingPhysicalAgentComponent;
		var npc : CNewNPC;
		
		super.OnEffectAdded(customParams);
		
		wasKnockedDown = false;	
		animatedComponent = ( CAnimatedComponent )target.GetComponentByClassName( 'CAnimatedComponent' );
		if( animatedComponent )
		{
			params = (W3FrozenEffectCustomParams)customParams;		
			
			npc = (CNewNPC)target;
			if(npc)
			{
				mpac = (CMovingPhysicalAgentComponent)target.GetComponentByClassName('CMovingPhysicalAgentComponent');
				targetWasFlying = npc.IsFlying();
				if(targetWasFlying && mpac)
				{
					mpac.SetAnimatedMovement( false );
				}
			}
			else
			{
				targetWasFlying = false;
			}
			
			animatedComponent.FreezePose();
			pushPriority = target.GetInteractionPriority();
			target.SetInteractionPriority(IP_Max_Unpushable);
		}
		
		target.SetKinematic( true );
		wasKnockedDown = true;
		
		effectManager.PauseAllRegenEffects('FrozenEffect');

		if( target.HasTag( 'scolopendromorph' ) )
		{
			target.StopEffect( 'dirt_base' );
		}
	}
	
	event OnEffectAddedPost()
	{
		var dm : CDefinitionsManagerAccessor;
		var min, max : SAbilityAttributeValue;
		var customDur : float;
		
		super.OnEffectAddedPost();
		
		customDur = ModCheats_GetFreezeDuration();
		if ( customDur > 0 )
		{
			duration = customDur;
			initialDuration = customDur;
			timeLeft = customDur;
		}
		else
		{
			duration = 6.0f;
			initialDuration = 6.0f;
			timeLeft = 6.0f;
		}

		theGame.GetSurfacePostFX().AddSurfacePostFXGroup( target.GetWorldPosition(), 0.3f, duration, 2.f, 5.f, 0 );
		target.FreezeCloth( true );
		
		dm = theGame.GetDefinitionsManager();		
		dm.GetAbilityAttributeValue(abilityName, 'hpPercDamageBonusPerHit', min, max);
		bonusDamagePercents = CalculateAttributeValue(GetAttributeRandomizedValue(min, max));
		
		killOnHit = false;
	}
	
	public function OnTargetDeath()
	{
		ModCheats_UnfreezeAndRagdoll((CActor)target);
		super.OnTargetDeath();
	}
	
	event OnEffectRemoved()
	{
		var	animatedComponent 	: CAnimatedComponent;
		var mpac				: CMovingPhysicalAgentComponent;
		var actorTarget			: CActor;
		
		super.OnEffectRemoved();

		actorTarget = (CActor)target;
		
		animatedComponent = ( CAnimatedComponent )target.GetComponentByClassName( 'CAnimatedComponent' );
		if( animatedComponent )
		{
			if( actorTarget && !actorTarget.IsAlive() )
			{
				animatedComponent.UnfreezePose();
			}
			else
			{
				animatedComponent.UnfreezePoseFadeOut( 1.0f );
			}

			if(targetWasFlying)
			{
				mpac = (CMovingPhysicalAgentComponent)target.GetComponentByClassName('CMovingPhysicalAgentComponent');
				if(mpac)
				{
					mpac.SetAnimatedMovement(true);
				}
			}
		}
		target.SignalGameplayEventParamInt('ForceStopCriticalEffect',(int)criticalStateType);
		effectManager.ResumeAllRegenEffects('FrozenEffect');
		target.RequestCriticalAnimStop();
		
		target.SetInteractionPriority(pushPriority);
		target.SetKinematic( false );
		target.FreezeCloth( false );

		if( actorTarget && !actorTarget.IsAlive() )
		{
			ModCheats_UnfreezeAndRagdoll(actorTarget);
		}
	}
	
	public function KillOnHit() : bool
	{
		return false;
	}
	
	public function OnTimeUpdated(deltaTime : float)
	{
		var actorTarget : CActor;

		actorTarget = (CActor)target;
		if( actorTarget && !actorTarget.IsAlive() )
		{
			timeLeft = 0;
			target.RemoveEffect( this, true );
			ModCheats_UnfreezeAndRagdoll(actorTarget);
			return;
		}

		if ( isActive )
		{
			timeActive += deltaTime;
		}
		
		if(pauseCounters.Size() == 0)
		{							
			if( duration != -1 )
				timeLeft -= deltaTime;				
			OnUpdate(deltaTime);	
		}
		
		if(timeLeft <= 0)
		{
			LogCritical("Deactivating not animated CS <<" + criticalStateType + ">>");
			isActive = false;			
		}
	}
	
	public function GetAdditionalDamagePercents() : float
	{
		return bonusDamagePercents;
	}
}