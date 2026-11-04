/***********************************************************************/
/** 	© 2015 CD PROJEKT S.A. All rights reserved.
/** 	THE WITCHER© is a trademark of CD PROJEKT S. A.
/** 	The Witcher game is based on the prose of Andrzej Sapkowski. 
/***********************************************************************/
class W3AardProjectile extends W3SignProjectile
{
	protected var staminaDrainPerc : float;
	protected var shouldCheatFreeze : bool;
	
	public function AddHitEntity( entity : CGameplayEntity )
	{
		if ( hitEntities.FindFirst( entity ) == -1 )
		{
			hitEntities.PushBack( entity );
		}
	}
	
	event OnProjectileCollision( pos, normal : Vector, collidingComponent : CComponent, hitCollisionsGroups : array< name >, actorIndex : int, shapeIndex : int )
	{
		var projectileVictim : CProjectileTrajectory;
		
		projectileVictim = (CProjectileTrajectory)collidingComponent.GetEntity();
		
		if( projectileVictim )
		{
			projectileVictim.OnAardHit( this );
		}
		
		super.OnProjectileCollision( pos, normal, collidingComponent, hitCollisionsGroups, actorIndex, shapeIndex );
	}
	
	protected function ProcessCollision( collider : CGameplayEntity, pos, normal : Vector )
	{
		var dmgVal : float;
		var sp : SAbilityAttributeValue;
		var isMutation6 : bool;
		var victimNPC : CNewNPC;
		var aardDRTier : int;
	
	
		
		if ( hitEntities.FindFirst( collider ) != -1 )
		{
			return;
		}
		
		
		hitEntities.PushBack( collider );
	
		super.ProcessCollision( collider, pos, normal );
		
		victimNPC = (CNewNPC) collider;
		
		aardDRTier = 1;

		if( owner.IsPlayer() && victimNPC )
		{
			aardDRTier = victimNPC.SignDRRegisterAard();
		}
			
		shouldCheatFreeze = false;
		if( owner.IsPlayer() && victimNPC )
		{
			if( victimNPC.HasBuff( EET_Frozen ) || ( ( W3PlayerWitcher )owner.GetPlayer() && GetWitcherPlayer().IsMutationActive( EPMT_Mutation6 ) ) )
			{
				shouldCheatFreeze = true;
			}
			else if( ModCheats_GetAardFreezeChance() > 0 )
			{
				if( ModCheats_GetAardFreezeChance() >= 100 || RandRange( 100, 1 ) <= ModCheats_GetAardFreezeChance() )
				{
					shouldCheatFreeze = true;
				}
			}
		}
		
		if( IsRequiredAttitudeBetween(victimNPC, caster, true ) )
		{
			isMutation6 = ( ( W3PlayerWitcher )owner.GetPlayer() && ( GetWitcherPlayer().IsMutationActive( EPMT_Mutation6 ) || shouldCheatFreeze ) );
			if( isMutation6 )
			{
				action.SetBuffSourceName( "Mutation6" );
			}
			else if ( owner.CanUseSkill( S_Magic_s33 ) )	
			{
				action.AddDamage( theGame.params.DAMAGE_NAME_DIRECT, GetWitcherPlayer().CalcMagic33Damage() );
			}
		}
		else
		{
			isMutation6 = false;
		}
		
		action.SetHitAnimationPlayType(EAHA_ForceNo);
		action.SetProcessBuffsIfNoDamage(true);
		
		
		if ( !owner.IsPlayer() )
		{
			action.AddEffectInfo( EET_KnockdownTypeApplicator );
		}
		
		
		
		
		
		
		if( owner.IsPlayer() && victimNPC )
		{
			if( shouldCheatFreeze )
			{
				action.ClearDamage();
				action.AddDamage( theGame.params.DAMAGE_NAME_FORCE, 30.0f );
				action.AddDamage( theGame.params.DAMAGE_NAME_FROST, 20.0f );

				action.RemoveBuffsByType( EET_KnockdownTypeApplicator );
				action.RemoveBuffsByType( EET_Knockdown );
				action.RemoveBuffsByType( EET_HeavyKnockdown );
				action.RemoveBuffsByType( EET_LongStagger );
				action.RemoveBuffsByType( EET_Stagger );
				action.RemoveBuffsByType( EET_Ragdoll );

				action.SetHitReactionType( EHRT_None, false );
				action.SetHitAnimationPlayType( EAHA_ForceNo );
				action.SetBuffSourceName( "Mutation6" );

				victimNPC.RemoveAllBuffsOfType( EET_HeavyKnockdown );
				victimNPC.RemoveAllBuffsOfType( EET_Knockdown );
				victimNPC.RemoveAllBuffsOfType( EET_Ragdoll );
				victimNPC.RemoveAllBuffsOfType( EET_LongStagger );
				victimNPC.RemoveAllBuffsOfType( EET_Stagger );
			}
			else if( aardDRTier == 2 )
			{
				action.RemoveBuffsByType( EET_KnockdownTypeApplicator );
				action.RemoveBuffsByType( EET_Knockdown );
				action.RemoveBuffsByType( EET_HeavyKnockdown );
				action.RemoveBuffsByType( EET_LongStagger );
				action.RemoveBuffsByType( EET_Stagger );
				action.RemoveBuffsByType( EET_Ragdoll );

				action.AddEffectInfo( EET_LongStagger );
			}
			else if( aardDRTier == 3 )
			{
				action.RemoveBuffsByType( EET_KnockdownTypeApplicator );
				action.RemoveBuffsByType( EET_Knockdown );
				action.RemoveBuffsByType( EET_HeavyKnockdown );
				action.RemoveBuffsByType( EET_LongStagger );
				action.RemoveBuffsByType( EET_Stagger );
				action.RemoveBuffsByType( EET_Ragdoll );

				action.AddEffectInfo( EET_Stagger );
			}
			else if( aardDRTier >= 4 )
			{
				action.RemoveBuffsByType( EET_KnockdownTypeApplicator );
				action.RemoveBuffsByType( EET_Knockdown );
				action.RemoveBuffsByType( EET_HeavyKnockdown );
				action.RemoveBuffsByType( EET_LongStagger );
				action.RemoveBuffsByType( EET_Stagger );
				action.RemoveBuffsByType( EET_Ragdoll );

				action.SetHitReactionType( EHRT_None, false );
				action.SetHitAnimationPlayType( EAHA_ForceNo );
			}
		}
		
		
		theGame.damageMgr.ProcessAction( action );
		
		CheckFrostEffect ( collider );

		if( !shouldCheatFreeze )
		{
			collider.OnAardHit( this );
		}
		else
		{
			collider.OnFrostHit( this );
		}
		
		
		
		if( isMutation6 && victimNPC && victimNPC.IsAlive() )
		{
			ProcessMutation6( victimNPC );
		}
	}
	
	private function CheckFrostEffect ( collider : CGameplayEntity )
	{
		var isMutation6 : bool;
		
		isMutation6 = ( ( W3PlayerWitcher )owner.GetPlayer() && GetWitcherPlayer().IsMutationActive( EPMT_Mutation6 ) );
		
		if ( collider && isMutation6 )
			collider.OnFrostHit(this);
	}
	
	private final function ProcessMutation6( victimNPC : CNewNPC )
	{
		var freezeParams : SCustomEffectParams;
		var combatStorage : CBaseAICombatStorage;

		// 1. Remove all knockdowns/staggers so target stays upright in FreezePose
		victimNPC.RemoveAllBuffsOfType( EET_HeavyKnockdown );
		victimNPC.RemoveAllBuffsOfType( EET_Knockdown );
		victimNPC.RemoveAllBuffsOfType( EET_Ragdoll );
		victimNPC.RemoveAllBuffsOfType( EET_LongStagger );
		victimNPC.RemoveAllBuffsOfType( EET_Stagger );

		combatStorage = (CBaseAICombatStorage)victimNPC.GetScriptStorageObject('CombatData');
		if( combatStorage )
		{
			combatStorage.SetIsInImportantAnim( false );
		}

		// 2. Guaranteed Freeze - NO instant kill, NO dismemberment explosion
		freezeParams.effectType = EET_Frozen;
		freezeParams.creator = this;
		freezeParams.sourceName = "Mutation 6";
		freezeParams.duration = ModCheats_GetFreezeDuration();
		freezeParams.isSignEffect = true;
		victimNPC.AddEffectCustom( freezeParams );

		victimNPC.AddEffectDefault( EET_SlowdownFrost, this, "Mutation 6", true );
	}
	
	event OnAttackRangeHit( entity : CGameplayEntity )
	{
		entity.OnAardHit( this );
	}
	
	public final function GetStaminaDrainPerc() : float
	{
		return staminaDrainPerc;
	}
	
	public final function SetStaminaDrainPerc(p : float)
	{
		staminaDrainPerc = p;
	}
}



class W3AxiiProjectile extends W3SignProjectile
{
	protected function ProcessCollision( collider : CGameplayEntity, pos, normal : Vector )
	{
		DestroyAfter( 3.f );
		
		collider.OnAxiiHit( this );	
		
	}
	
	protected function ShouldCheckAttitude() : bool
	{
		return false;
	}
}

class W3IgniProjectile extends W3SignProjectile
{
	private var channelCollided : bool;
	private var dt : float;	
	private var isUsed : bool;
	
	default channelCollided = false;
	default isUsed = false;
	
	public function SetDT(d : float)
	{
		dt = d;
	}

	public function IsUsed() : bool
	{
		return isUsed;
	}

	public function SetIsUsed( used : bool )
	{
		isUsed = used;
	}

	event OnProjectileCollision( pos, normal : Vector, collidingComponent : CComponent, hitCollisionsGroups : array< name >, actorIndex : int, shapeIndex : int )
	{
		var rot, rotImp : EulerAngles;
		var v, posF, pos2, n : Vector;
		var igniEntity : W3IgniEntity;
		var ent, colEnt : CEntity;
		var template : CEntityTemplate;
		var f : float;
		var test : bool;
		var postEffect : CGameplayFXSurfacePost;
		
		channelCollided = true;
		
		
		igniEntity = (W3IgniEntity)signEntity;
		
		if(signEntity.IsAlternateCast())
		{			
			
			test = (!collidingComponent && hitCollisionsGroups.Contains( 'Terrain' ) ) || (collidingComponent && !((CActor)collidingComponent.GetEntity()));
			
			colEnt = collidingComponent.GetEntity();
			if( (W3BoltProjectile)colEnt || (W3SignEntity)colEnt || (W3SignProjectile)colEnt )
				test = false;
			
			if(test)
			{
				f = theGame.GetEngineTimeAsSeconds();
				
				if(f - igniEntity.lastFxSpawnTime >= 1)
				{
					igniEntity.lastFxSpawnTime = f;
					
					template = (CEntityTemplate)LoadResource( "igni_object_fx" );
					
					
					rot.Pitch	= AcosF( VecDot( Vector( 0, 0, 0 ), normal ) );
					rot.Yaw		= this.GetHeading();
					rot.Roll	= 0.0f;
					
					
					posF = pos + VecNormalize(pos - signEntity.GetWorldPosition());
					if(theGame.GetWorld().StaticTrace(pos, posF, pos2, n, igniEntity.projectileCollision))
					{					
						ent = theGame.CreateEntity(template, pos2, rot );
						ent.AddTimer('TimerStopVisualFX', 5, , , , true);
						
						postEffect = theGame.GetSurfacePostFX();
						postEffect.AddSurfacePostFXGroup( pos2, 0.5f, 8.0f, 10.0f, 0.3f, 1 );
					}
				}				
			}
			
			
			if ( !hitCollisionsGroups.Contains( 'Water' ) )
			{
				
				v = GetWorldPosition() - signEntity.GetWorldPosition();
				rot = MatrixGetRotation(MatrixBuildFromDirectionVector(-v));
				
				igniEntity.ShowChannelingCollisionFx(GetWorldPosition(), rot, -v);
			}
		}
		
		return super.OnProjectileCollision(pos, normal, collidingComponent, hitCollisionsGroups, actorIndex, shapeIndex);
	}

	protected function ProcessCollision( collider : CGameplayEntity, pos, normal : Vector )
	{
		var signPower, channelDmg : SAbilityAttributeValue;
		var burnChance : float;					
		var maxArmorReduction : float;			
		var applyNbr : int;						
		var i : int;
		var npc : CNewNPC;
		var armorRedAblName : name;
		var currentReduction : int;
		var actorVictim : CActor;
		var ownerActor : CActor;
		var dmg : float;
		var performBurningTest : bool;
		var igniEntity : W3IgniEntity;
		var postEffect : CGameplayFXSurfacePost = theGame.GetSurfacePostFX();
		var igniDRTier : int;
		
		postEffect.AddSurfacePostFXGroup( pos, 0.5f, 8.0f, 10.0f, 2.5f, 1 );
		
		
		if ( hitEntities.Contains( collider ) )
		{
			return;
		}
		hitEntities.PushBack( collider );		
		
		super.ProcessCollision( collider, pos, normal );	
			
		ownerActor = owner.GetActor();
		actorVictim = ( CActor ) action.victim;
		npc = (CNewNPC)collider;
				
		
		if(signEntity.IsAlternateCast())		
		{
			igniEntity = (W3IgniEntity)signEntity;
			performBurningTest = igniEntity.UpdateBurningChance(actorVictim, dt);
			
			
			
			if( igniEntity.hitEntities.Contains( collider ) )
			{
				channelCollided = true;
				action.SetHitEffect('');
				action.SetHitEffect('', true );
				action.SetHitEffect('', false, true);
				action.SetHitEffect('', true, true);
				action.ClearDamage();
				
				
				channelDmg = owner.GetSkillAttributeValue(signSkill, 'channeling_damage', false, true);
				dmg = channelDmg.valueAdditive + channelDmg.valueMultiplicative * actorVictim.GetMaxHealth();
				dmg *= dt;
				action.AddDamage(theGame.params.DAMAGE_NAME_FIRE, dmg);
				action.SetIsDoTDamage(dt);
				
				if(!collider)	
					return;
			}
			else
			{
				igniEntity.hitEntities.PushBack( collider );
			}
			
			if(!performBurningTest)
			{
				action.ClearEffects();
			}
		}
		
		
		if ( npc && npc.IsShielded( ownerActor ) )
		{
			collider.OnIgniHit( this );	
			return;
		}
		
		igniDRTier = 1;

		if( owner.IsPlayer() && npc )
		{
			igniDRTier = npc.SignDRRegisterIgni( IsProjectileFromChannelMode() );
		}
		
		
		
		signPower = signEntity.GetOwner().GetTotalSignSpellPower(signEntity.GetSkill());

		
		if ( !owner.IsPlayer() )
		{
			
			burnChance = signPower.valueMultiplicative;
			if ( RandF() < burnChance )
			{
				action.AddEffectInfo(EET_Burning);
			}
			
			dmg = CalculateAttributeValue(signPower);
			if ( dmg <= 0 )
			{
				dmg = 20;
			}			
			action.AddDamage( theGame.params.DAMAGE_NAME_FIRE, dmg);
		}
		
		if(signEntity.IsAlternateCast())
		{
			action.SetHitAnimationPlayType(EAHA_ForceNo);
		}
		else		
		{
			
			if(ownerActor.HasTag('mq1060_witcher'))
			{
				action.SetHitEffect('igni_cone_hit_red', false, false);
				action.SetHitEffect('igni_cone_hit_red', true, false);
			}
			else
			{
				action.SetHitEffect('igni_cone_hit', false, false);
				action.SetHitEffect('igni_cone_hit', true, false);
			}			
			action.SetHitReactionType(EHRT_Igni, false);
		}
		
		if( owner.IsPlayer() && npc )
		{
			if( igniDRTier == 2 )
			{
				if( RandF() >= 0.60f )
				{
					action.RemoveBuffsByType( EET_Burning );
				}
			}
			else if( igniDRTier == 3 )
			{
				if( RandF() >= 0.25f )
				{
					action.RemoveBuffsByType( EET_Burning );
				}
			}
			else if( igniDRTier >= 4 )
			{
				action.RemoveBuffsByType( EET_Burning );
			}
		}
		
		
		theGame.damageMgr.ProcessAction( action );	
		
		
		if ( owner.CanUseSkill(S_Magic_s08) && (CActor)collider)
		{	
			maxArmorReduction = CalculateAttributeValue(owner.GetSkillAttributeValue(S_Magic_s08, 'max_armor_reduction', false, true)) * GetWitcherPlayer().GetSkillLevel(S_Magic_s08);
			applyNbr = RoundMath( 100 * maxArmorReduction * ( signPower.valueMultiplicative / theGame.params.MAX_SPELLPOWER_ASSUMED ) );
			
			armorRedAblName = SkillEnumToName(S_Magic_s08);
			currentReduction = ((CActor)collider).GetAbilityCount(armorRedAblName);
			
			applyNbr -= currentReduction;
			
			for ( i = 0; i < applyNbr; i += 1 )
				action.victim.AddAbility(armorRedAblName, true);
		}	
		collider.OnIgniHit( this );
		if ( owner.IsPlayer() && actorVictim )
		{
			actorVictim.RemoveAllBuffsOfType( EET_Frozen );
			ModCheats_TriggerIgniFirePillar( actorVictim, ownerActor );
		}
	}	

	event OnAttackRangeHit( entity : CGameplayEntity )
	{
		entity.OnIgniHit( this );
	}

	
	event OnRangeReached()
	{
		var v : Vector;
		var rot : EulerAngles;
				
		
		if(!channelCollided)
		{			
			
			v = GetWorldPosition() - signEntity.GetWorldPosition();
			rot = MatrixGetRotation(MatrixBuildFromDirectionVector(-v));
			((W3IgniEntity)signEntity).ShowChannelingRangeFx(GetWorldPosition(), rot);
		}
		
		isUsed = false;
		
		super.OnRangeReached();
	}
	
	public function IsProjectileFromChannelMode() : bool
	{
		return signSkill == S_Magic_s02 || signSkill == S_Magic_s28;
	}
}