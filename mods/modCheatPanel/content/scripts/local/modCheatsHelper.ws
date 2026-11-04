/***********************************************************************/
/** Mod Cheats Helper Functions
/***********************************************************************/

function ModCheats_GetConfigValue(groupName : name, varName : name) : string
{
	var config : CInGameConfigWrapper;
	var val : string;
	
	config = theGame.GetInGameConfigWrapper();
	if ( config )
	{
		val = config.GetVarValue(groupName, varName);
		if ( val != "" )
		{
			return val;
		}
		val = config.GetVarValue('CheatsMain', varName);
		if ( val != "" )
		{
			return val;
		}
		val = config.GetVarValue('CheatsCrossbow', varName);
		if ( val != "" )
		{
			return val;
		}
		val = config.GetVarValue('CheatsProgression', varName);
		if ( val != "" )
		{
			return val;
		}
		val = config.GetVarValue('CheatsRunes', varName);
		if ( val != "" )
		{
			return val;
		}
		val = config.GetVarValue('CheatsEconomy', varName);
		if ( val != "" )
		{
			return val;
		}
		val = config.GetVarValue('CheatsSigns', varName);
		if ( val != "" )
		{
			return val;
		}
		return config.GetVarValue('Cheats', varName);
	}
	return "";
}


function ModCheats_IsGodMode() : bool
{
	var config : CInGameConfigWrapper;
	config = theGame.GetInGameConfigWrapper();
	if ( config )
	{
		return ModCheats_GetConfigValue('CheatsMain', 'CheatGodMode') == "true";
	}
	return false;
}

function ModCheats_IsZeroToxicity() : bool
{
	var config : CInGameConfigWrapper;
	config = theGame.GetInGameConfigWrapper();
	if ( config )
	{
		return ModCheats_GetConfigValue('CheatsMain', 'CheatZeroToxicity') == "true";
	}
	return false;
}

function ModCheats_IsAllMutationsActive() : bool
{
	var config : CInGameConfigWrapper;
	config = theGame.GetInGameConfigWrapper();
	if ( config )
	{
		return ModCheats_GetConfigValue('CheatsProgression', 'CheatAllMutationsActive') == "true";
	}
	return false;
}

function ModCheats_IsAllSkillsActive() : bool
{
	var config : CInGameConfigWrapper;
	config = theGame.GetInGameConfigWrapper();
	if ( config )
	{
		return ModCheats_GetConfigValue('CheatsProgression', 'CheatAllSkillsActive') == "true";
	}
	return false;
}

function ModCheats_GetDamageMultiplier() : float
{
	var config : CInGameConfigWrapper;
	var valStr : string;
	var val : float;
	
	config = theGame.GetInGameConfigWrapper();
	if ( config )
	{
		valStr = ModCheats_GetConfigValue('CheatsMain', 'CheatDamageMult');
		val = StringToFloat(valStr, 1.0);
		if ( val >= 1.0 && val <= 10.0 )
		{
			return val;
		}
	}
	return 1.0;
}

function ModCheats_GetIgniRangeMode() : int
{
	var config : CInGameConfigWrapper;
	var valStr : string;
	var val : int;
	
	config = theGame.GetInGameConfigWrapper();
	if ( config )
	{
		valStr = ModCheats_GetConfigValue('CheatsIgni', 'CheatIgniRange');
		val = StringToInt(valStr, 0);
		if ( val >= 0 && val <= 3 )
		{
			return val;
		}
	}
	return 0;
}

function ModCheats_IsIgniPillarEnabled() : bool
{
	return ModCheats_GetConfigValue('CheatsIgni', 'CheatIgniPillar') == "true";
}

function ModCheats_GetIgniPillarType() : int
{
	var valStr : string;
	var mode : int;
	valStr = ModCheats_GetConfigValue('CheatsIgni', 'CheatIgniPillarType');
	mode = StringToInt(valStr, 0);
	if ( mode >= 0 && mode <= 2 )
		return mode;
	return 0;
}

function ModCheats_GetIgniPillarDamageMode() : int
{
	var valStr : string;
	var mode : int;
	valStr = ModCheats_GetConfigValue('CheatsIgni', 'CheatIgniPillarDamage');
	mode = StringToInt(valStr, 0);
	if ( mode >= 0 && mode <= 4 )
		return mode;
	return 0;
}

function ModCheats_GetAardRangeMode() : int
{
	var config : CInGameConfigWrapper;
	var valStr : string;
	var val : int;
	
	config = theGame.GetInGameConfigWrapper();
	if ( config )
	{
		valStr = ModCheats_GetConfigValue('CheatsAard', 'CheatAardRange');
		val = StringToInt(valStr, 0);
		if ( val >= 0 && val <= 3 )
		{
			return val;
		}
	}
	return 0;
}

function ModCheats_GetAardFreezeChance() : int
{
	var config : CInGameConfigWrapper;
	var valStr : string;
	var val : int;
	
	config = theGame.GetInGameConfigWrapper();
	if ( config )
	{
		valStr = ModCheats_GetConfigValue('CheatsAard', 'CheatAardFreeze');
		val = StringToInt(valStr, 0);
		if ( val >= 0 && val <= 100 )
		{
			return val;
		}
	}
	return 0;
}

function ModCheats_GetFreezeDuration() : float
{
	var config : CInGameConfigWrapper;
	var valStr : string;
	var mode : int;
	
	config = theGame.GetInGameConfigWrapper();
	if ( config )
	{
		valStr = ModCheats_GetConfigValue('CheatsAard', 'CheatAardFreezeDuration');
		mode = StringToInt(valStr, 0);
		switch ( mode )
		{
			case 1:  return 10.0f;
			case 2:  return 15.0f;
			case 3:  return 30.0f;
			case 4:  return 60.0f;
			case 5:  return 180.0f;
			case 6:  return 99999.0f;
			default: return 6.0f;
		}
	}
	return 6.0f;
}

function ModCheats_GetYrdenRangeMode() : int
{
	var config : CInGameConfigWrapper;
	var valStr : string;
	var val : int;
	
	config = theGame.GetInGameConfigWrapper();
	if ( config )
	{
		valStr = ModCheats_GetConfigValue('CheatsYrden', 'CheatYrdenRange');
		val = StringToInt(valStr, 0);
		if ( val >= 0 && val <= 3 )
		{
			return val;
		}
	}
	return 0;
}

function ModCheats_GetYrdenSlowMode() : int
{
	var config : CInGameConfigWrapper;
	var valStr : string;
	var val : int;
	
	config = theGame.GetInGameConfigWrapper();
	if ( config )
	{
		valStr = ModCheats_GetConfigValue('CheatsYrden', 'CheatYrdenSlow');
		val = StringToInt(valStr, 0);
		if ( val >= 0 && val <= 5 )
		{
			return val;
		}
	}
	return 0;
}

function ModCheats_GetAxiiRangeMode() : int
{
	var config : CInGameConfigWrapper;
	var valStr : string;
	var val : int;
	
	config = theGame.GetInGameConfigWrapper();
	if ( config )
	{
		valStr = ModCheats_GetConfigValue('CheatsAxii', 'CheatAxiiRange');
		val = StringToInt(valStr, 0);
		if ( val >= 0 && val <= 3 )
		{
			return val;
		}
	}
	return 0;
}

function ModCheats_GetAxiiDurationMode() : int
{
	var config : CInGameConfigWrapper;
	var valStr : string;
	var val : int;
	
	config = theGame.GetInGameConfigWrapper();
	if ( config )
	{
		valStr = ModCheats_GetConfigValue('CheatsAxii', 'CheatAxiiDuration');
		val = StringToInt(valStr, 0);
		if ( val >= 0 && val <= 5 )
		{
			return val;
		}
	}
	return 0;
}

function ModCheats_GetAxiiCustomDuration(defaultDur : float) : float
{
	var mode : int;
	mode = ModCheats_GetAxiiDurationMode();
	switch ( mode )
	{
		case 1: return 15.0f;
		case 2: return 30.0f;
		case 3: return 60.0f;
		case 4: return 180.0f;
		case 5: return 9999.0f;
	}
	return defaultDur;
}

function ModCheats_GetQuenMode() : int
{
	var config : CInGameConfigWrapper;
	var valStr : string;
	var val : int;
	
	config = theGame.GetInGameConfigWrapper();
	if ( config )
	{
		valStr = ModCheats_GetConfigValue('CheatsQuen', 'CheatQuenMode');
		val = StringToInt(valStr, 0);
		if ( val >= 0 && val <= 1 )
		{
			return val;
		}
	}
	return 0;
}

function ModCheats_GetQuenDurationMode() : int
{
	var config : CInGameConfigWrapper;
	var valStr : string;
	var val : int;
	
	config = theGame.GetInGameConfigWrapper();
	if ( config )
	{
		valStr = ModCheats_GetConfigValue('CheatsQuen', 'CheatQuenDuration');
		val = StringToInt(valStr, 0);
		if ( val >= 0 && val <= 4 )
		{
			return val;
		}
	}
	return 0;
}

function ModCheats_GetQuenCustomDuration(defaultDur : float) : float
{
	var mode : int;
	mode = ModCheats_GetQuenDurationMode();
	switch ( mode )
	{
		case 1: return 60.0f;
		case 2: return 180.0f;
		case 3: return 300.0f;
		case 4: return 9999.0f;
	}
	return defaultDur;
}

function ModCheats_ApplyIgniDamage( parentSign : W3SignEntity, casterOwner : W3SignOwner, projectile : W3SignProjectile, spawnPos : Vector, heading : Vector, distance : float, coneAngle : float, igniRangeMode : int )
{
	var casterActor : CActor;
	var allActors : array<CActor>;
	var actorVictim : CActor;
	var npc : CNewNPC;
	var action : W3DamageAction;
	var signPower : SAbilityAttributeValue;
	var dmg, headingAngle, angleToObj : float;
	var i : int;
	var diffVec : Vector;

	if ( !parentSign || !casterOwner || igniRangeMode == 0 )
	{
		return;
	}

	casterActor = casterOwner.GetActor();
	if ( !casterActor )
	{
		return;
	}

	allActors = GetActorsInRange( casterActor, distance, 50, '', true );
	headingAngle = VecHeading( heading );

	for ( i = 0; i < allActors.Size(); i += 1 )
	{
		actorVictim = allActors[i];
		if ( !actorVictim || !actorVictim.IsAlive() || actorVictim == casterActor )
		{
			continue;
		}

		if ( igniRangeMode < 3 )
		{
			diffVec = actorVictim.GetWorldPosition() - spawnPos;
			angleToObj = AbsF( AngleDistance( headingAngle, VecHeading(diffVec) ) );
			if ( angleToObj > coneAngle * 0.5f )
			{
				continue;
			}
		}

		npc = (CNewNPC)actorVictim;
		if ( npc && npc.IsShielded( casterActor ) )
		{
			if ( projectile )
			{
				actorVictim.OnIgniHit( (W3IgniProjectile)projectile );
			}
			continue;
		}

		action = new W3DamageAction in theGame.damageMgr;
		action.Initialize( casterActor, actorVictim, parentSign, "igni_sign", EHRT_Igni, CPS_SpellPower, false, false, true, false );
		parentSign.InitSignDataForDamageAction( action );
		action.hitLocation = actorVictim.GetWorldPosition();
		action.SetHitEffect( 'critical_burning', false, false );
		action.SetHitEffect( 'critical_burning', true, false );
		action.SetHitReactionType( EHRT_Igni, false );

		signPower = casterActor.GetTotalSignSpellPower( parentSign.GetSkill() );
		dmg = CalculateAttributeValue( signPower );
		if ( dmg <= 0 )
		{
			dmg = 120.0f;
		}
		dmg *= ModCheats_GetDamageMultiplier();
		action.AddDamage( theGame.params.DAMAGE_NAME_FIRE, dmg );

		theGame.damageMgr.ProcessAction( action );

		actorVictim.RemoveAllBuffsOfType( EET_Frozen );

		if ( projectile )
		{
			actorVictim.OnIgniHit( (W3IgniProjectile)projectile );
		}

		ModCheats_TriggerIgniFirePillar( actorVictim, casterActor );
	}
}

function ModCheats_ApplyIgniVisuals( parentSign : W3SignEntity, casterOwner : W3SignOwner, spawnPos : Vector, spawnRot : EulerAngles, heading : Vector, igniRangeMode : int )
{
	var i, j, numAxes, numSteps : int;
	var rot : EulerAngles;
	var sideSign : W3IgniEntity;
	var casterActor : CActor;
	var axisDir, sparkPos : Vector;
	var signTemplate : CEntityTemplate;
	var collisionFxTemplate : CEntityTemplate;
	var sparkEnt : CEntity;
	var currentDist, stepDist : float;
	var igniSign : W3IgniEntity;

	if ( !parentSign || !casterOwner || igniRangeMode == 0 )
	{
		return;
	}

	casterActor = casterOwner.GetActor();
	signTemplate = GetWitcherPlayer().GetSignTemplate(ST_Igni);
	collisionFxTemplate = (CEntityTemplate)LoadResource("gameplay\sign\igni_channeling_collision_fx");
	igniSign = (W3IgniEntity)parentSign;

	parentSign.PlayEffect( 'cone' );
	if ( igniSign && igniSign.effects.Size() > 0 )
	{
		parentSign.PlayEffect( igniSign.effects[0].throwEffect );
	}

	if ( igniRangeMode == 1 )
	{
		numAxes = 3;
		numSteps = 2;
		stepDist = 5.5f;

		for ( i = 0; i < numAxes; i += 1 )
		{
			rot = spawnRot;
			if ( i == 0 ) rot.Yaw -= 30.0;
			else if ( i == 2 ) rot.Yaw += 30.0;

			axisDir = RotForward(rot);

			if ( i != 1 && signTemplate )
			{
				sideSign = (W3IgniEntity)theGame.CreateEntity( signTemplate, spawnPos, rot );
				if ( sideSign )
				{
					sideSign.Init( casterOwner, parentSign, true, true );
					sideSign.PlayEffect( 'cone' );
					sideSign.DestroyAfter( 0.7 );
				}
			}

			if ( collisionFxTemplate )
			{
				for ( j = 1; j <= numSteps; j += 1 )
				{
					currentDist = ( (float)j ) * stepDist;
					sparkPos = spawnPos + axisDir * currentDist;
					sparkEnt = theGame.CreateEntity( collisionFxTemplate, sparkPos, rot );
					if ( sparkEnt ) sparkEnt.DestroyAfter( 0.5 );
				}
			}
		}

		theGame.GetSurfacePostFX().AddSurfacePostFXGroup( casterActor.GetWorldPosition() + heading * 5.0, 0.2f, 2.5f, 1.2f, 10.0f, 1 );
	}
	else if ( igniRangeMode == 2 )
	{
		numAxes = 5;
		numSteps = 3;
		stepDist = 6.8f;

		for ( i = 0; i < numAxes; i += 1 )
		{
			rot = spawnRot;
			if ( i == 0 ) rot.Yaw -= 50.0;
			else if ( i == 1 ) rot.Yaw -= 25.0;
			else if ( i == 3 ) rot.Yaw += 25.0;
			else if ( i == 4 ) rot.Yaw += 50.0;

			axisDir = RotForward(rot);

			if ( ( i == 0 || i == 4 ) && signTemplate )
			{
				sideSign = (W3IgniEntity)theGame.CreateEntity( signTemplate, spawnPos, rot );
				if ( sideSign )
				{
					sideSign.Init( casterOwner, parentSign, true, true );
					sideSign.PlayEffect( 'cone' );
					sideSign.DestroyAfter( 0.7 );
				}
			}

			if ( collisionFxTemplate )
			{
				for ( j = 1; j <= numSteps; j += 1 )
				{
					currentDist = ( (float)j ) * stepDist;
					sparkPos = spawnPos + axisDir * currentDist;
					sparkEnt = theGame.CreateEntity( collisionFxTemplate, sparkPos, rot );
					if ( sparkEnt ) sparkEnt.DestroyAfter( 0.6 );
				}
			}
		}

		theGame.GetSurfacePostFX().AddSurfacePostFXGroup( casterActor.GetWorldPosition() + heading * 8.0, 0.2f, 3.5f, 1.5f, 16.0f, 1 );
	}
	else if ( igniRangeMode == 3 )
	{
		numAxes = 6;
		numSteps = 2;
		stepDist = 7.0f;

		for ( i = 0; i < numAxes; i += 1 )
		{
			rot = spawnRot;
			rot.Yaw += ( (float)i ) * 60.0f;
			axisDir = RotForward(rot);

			if ( ( i == 2 || i == 4 ) && signTemplate )
			{
				sideSign = (W3IgniEntity)theGame.CreateEntity( signTemplate, spawnPos, rot );
				if ( sideSign )
				{
					sideSign.Init( casterOwner, parentSign, true, true );
					sideSign.PlayEffect( 'cone' );
					sideSign.DestroyAfter( 0.7 );
				}
			}

			if ( collisionFxTemplate )
			{
				for ( j = 1; j <= numSteps; j += 1 )
				{
					currentDist = ( (float)j ) * stepDist;
					sparkPos = spawnPos + axisDir * currentDist;
					sparkEnt = theGame.CreateEntity( collisionFxTemplate, sparkPos, rot );
					if ( sparkEnt ) sparkEnt.DestroyAfter( 0.5 );
				}
			}
		}

		theGame.GetSurfacePostFX().AddSurfacePostFXGroup( casterActor.GetWorldPosition(), 0.2f, 4.0f, 1.5f, 18.0f, 1 );
	}
}

function ModCheats_SpawnIgniGeyser( pos : Vector )
{
	var template : CEntityTemplate;
	var glyphTemplate : CEntityTemplate;
	var entity : CEntity;
	var meteorite : W3MeteorProjectile;
	var spawnPos, targetPos : Vector;
	var rotation : EulerAngles;
	var collisionGroups : array<name>;
	var i : int;

	template = (CEntityTemplate)LoadResource( 'eredin_meteorite' );
	if ( template )
	{
		collisionGroups.PushBack( 'Terrain' );
		collisionGroups.PushBack( 'Static' );

		for ( i = 0; i < 2; i += 1 )
		{
			spawnPos = pos;
			spawnPos.Z += 0.2f;
			if ( i == 1 )
			{
				spawnPos.X += RandRangeF( 0.6f, -0.6f );
				spawnPos.Y += RandRangeF( 0.6f, -0.6f );
			}

			targetPos = spawnPos;
			targetPos.X += RandRangeF( 1.5f, -1.5f );
			targetPos.Y += RandRangeF( 1.5f, -1.5f );
			targetPos.Z += 24.0f;

			entity = theGame.CreateEntity( template, spawnPos, rotation );
			meteorite = (W3MeteorProjectile)entity;
			if ( meteorite )
			{
				meteorite.Init( thePlayer );
				meteorite.decreasePlayerDmgBy = 1.0f;
				meteorite.explosionRadius = 2.5f;
				meteorite.projSpeed = RandRangeF( 40.0f, 30.0f );
				meteorite.projDMG = 0.0f;
				meteorite.ShootProjectileAtPosition( 0.0f, meteorite.projSpeed, targetPos, 500.0f, collisionGroups );
			}
		}
	}

	glyphTemplate = (CEntityTemplate)LoadResource( 'glyphword_12' );
	if ( glyphTemplate )
	{
		entity = theGame.CreateEntity( glyphTemplate, pos, rotation, , , true );
		if ( entity )
		{
			entity.DestroyAfter( 3.5f );
		}
	}
}

function ModCheats_SpawnIgniMeteor( targetPos : Vector, dmg : float )
{
	var template : CEntityTemplate;
	var entity : CEntity;
	var meteorite : W3MeteorProjectile;
	var spawnPos : Vector;
	var rotation : EulerAngles;
	var collisionGroups : array<name>;

	template = (CEntityTemplate)LoadResource( 'eredin_meteorite' );
	if ( !template )
	{
		return;
	}

	collisionGroups.PushBack( 'Terrain' );
	collisionGroups.PushBack( 'Static' );
	collisionGroups.PushBack( 'Destructible' );

	spawnPos = targetPos;
	spawnPos.X += RandRangeF( 1.5f, -1.5f );
	spawnPos.Y += RandRangeF( 1.5f, -1.5f );
	spawnPos.Z += 22.0f;

	entity = theGame.CreateEntity( template, spawnPos, rotation );
	meteorite = (W3MeteorProjectile)entity;
	if ( meteorite )
	{
		meteorite.Init( thePlayer );
		meteorite.decreasePlayerDmgBy = 1.0f;
		meteorite.explosionRadius = 3.5f;
		meteorite.projSpeed = 48.0f;
		meteorite.projDMG = dmg;
		meteorite.ShootProjectileAtPosition( 0.0f, meteorite.projSpeed, targetPos, 500.0f, collisionGroups );
	}
}

function ModCheats_TriggerIgniFirePillar( victim : CActor, caster : CActor )
{
	var action : W3DamageAction;
	var pos : Vector;
	var dmg : float;
	var dmgMode : int;
	var effectType : int;
	var curTime : float;
	var witcher : W3PlayerWitcher;
	var postEffect : CGameplayFXSurfacePost;

	if ( !victim || !victim.IsAlive() || !caster || !ModCheats_IsIgniPillarEnabled() )
	{
		return;
	}

	witcher = GetWitcherPlayer();
	if ( witcher )
	{
		curTime = theGame.GetEngineTimeAsSeconds();
		if ( curTime - witcher.modCheats_lastIgniPillarTime < 0.45f )
		{
			return;
		}
		witcher.modCheats_lastIgniPillarTime = curTime;
	}

	pos = victim.GetWorldPosition();
	effectType = ModCheats_GetIgniPillarType();
	dmgMode = ModCheats_GetIgniPillarDamageMode();

	switch ( dmgMode )
	{
		case 1:
			dmg = 50.0f;
			break;
		case 2:
			dmg = 150.0f;
			break;
		case 3:
			dmg = 400.0f;
			break;
		case 4:
			dmg = 3500.0f;
			break;
		default:
			dmg = 0.0f;
			break;
	}

	if ( effectType == 0 || effectType == 2 )
	{
		ModCheats_SpawnIgniGeyser( pos );
	}

	if ( effectType == 1 || effectType == 2 )
	{
		ModCheats_SpawnIgniMeteor( pos, dmg );
	}

	postEffect = theGame.GetSurfacePostFX();
	if ( postEffect )
	{
		postEffect.AddSurfacePostFXGroup( pos, 0.2f, 6.0f, 2.0f, 4.5f, 1 );
	}

	victim.RemoveAllBuffsOfType( EET_Frozen );
	victim.PlayEffectSingle( 'critical_burning' );
	victim.AddEffectDefault( EET_Burning, caster, "IgniPillar" );
	victim.AddEffectDefault( EET_Knockdown, caster, "IgniPillar" );

	if ( dmg > 0.0f && effectType == 0 )
	{
		action = new W3DamageAction in theGame.damageMgr;
		action.Initialize( caster, victim, NULL, "igni_pillar", EHRT_Light, CPS_SpellPower, false, false, true, false );
		action.hitLocation = pos;
		action.SetHitEffect( 'critical_burning', true, true );
		action.AddDamage( theGame.params.DAMAGE_NAME_FIRE, dmg );
		theGame.damageMgr.ProcessAction( action );
	}

	GCameraShake( 2.0f, true, pos, 20.0f );
}

function ModCheats_ApplyAardDamage( parentSign : W3SignEntity, casterOwner : W3SignOwner, projectile : W3SignProjectile, spawnPos : Vector, heading : Vector, distance : float, coneAngle : float, aardRangeMode : int )
{
	var casterActor : CActor;
	var allActors : array<CActor>;
	var actorVictim : CActor;
	var npc : CNewNPC;
	var action : W3DamageAction;
	var signPower : SAbilityAttributeValue;
	var forceDmg, frostDmg, headingAngle, angleToObj : float;
	var i, freezeChance : int;
	var shouldFreeze : bool;
	var envEntities : array<CGameplayEntity>;
	var envEntity : CGameplayEntity;
	var diffVec : Vector;
	var freezeParams : SCustomEffectParams;
	var combatStorage : CBaseAICombatStorage;

	freezeChance = ModCheats_GetAardFreezeChance();
	if ( !parentSign || !casterOwner || ( aardRangeMode == 0 && freezeChance == 0 && !GetWitcherPlayer().IsMutationActive( EPMT_Mutation6 ) ) )
	{
		return;
	}

	casterActor = casterOwner.GetActor();
	if ( !casterActor )
	{
		return;
	}

	allActors = GetActorsInRange( casterActor, distance, 50, '', true );
	headingAngle = VecHeading( heading );

	for ( i = 0; i < allActors.Size(); i += 1 )
	{
		actorVictim = allActors[i];
		if ( !actorVictim || !actorVictim.IsAlive() || actorVictim == casterActor )
		{
			continue;
		}

		if ( aardRangeMode < 3 )
		{
			diffVec = actorVictim.GetWorldPosition() - spawnPos;
			angleToObj = AbsF( AngleDistance( headingAngle, VecHeading(diffVec) ) );
			if ( angleToObj > coneAngle * 0.5f )
			{
				continue;
			}
		}

		npc = (CNewNPC)actorVictim;
		if ( npc && npc.IsShielded( casterActor ) )
		{
			if ( projectile )
			{
				actorVictim.OnAardHit( (W3AardProjectile)projectile );
			}
			continue;
		}

		// 1. Freeze calculation (% like Zoria rune or 100% with Mutation 6, without instant kill)
		shouldFreeze = false;
		if ( ( ( W3PlayerWitcher )casterOwner.GetPlayer() && GetWitcherPlayer().IsMutationActive( EPMT_Mutation6 ) ) )
		{
			shouldFreeze = true;
		}
		else if ( freezeChance > 0 )
		{
			if ( freezeChance >= 100 || RandRange( 100, 1 ) <= freezeChance )
			{
				shouldFreeze = true;
			}
		}

		if ( shouldFreeze )
		{
			npc = (CNewNPC)actorVictim;
			if ( npc )
			{
				combatStorage = (CBaseAICombatStorage)npc.GetScriptStorageObject('CombatData');
				if ( combatStorage )
				{
					combatStorage.SetIsInImportantAnim( false );
				}
			}

			// Remove knockdowns/staggers so target stays upright for FreezePose
			actorVictim.RemoveAllBuffsOfType( EET_HeavyKnockdown );
			actorVictim.RemoveAllBuffsOfType( EET_Knockdown );
			actorVictim.RemoveAllBuffsOfType( EET_Ragdoll );
			actorVictim.RemoveAllBuffsOfType( EET_LongStagger );
			actorVictim.RemoveAllBuffsOfType( EET_Stagger );

			freezeParams.effectType = EET_Frozen;
			freezeParams.creator = parentSign;
			freezeParams.sourceName = "Mutation 6";
			freezeParams.duration = ModCheats_GetFreezeDuration();
			freezeParams.isSignEffect = true;
			actorVictim.AddEffectCustom( freezeParams );

			actorVictim.AddEffectDefault( EET_SlowdownFrost, parentSign, "Mutation 6", true );
		}
		else
		{
			// Standard Aard knockdown if not frozen
			actorVictim.AddEffectDefault( EET_HeavyKnockdown, parentSign, "Aard", true );
			actorVictim.AddEffectDefault( EET_Knockdown, parentSign, "Aard", true );
		}

		// 2. Direct Force and Frost Damage scaled with Sign Spell Power & Cheat Damage Multiplier
		action = new W3DamageAction in theGame.damageMgr;
		action.Initialize( casterActor, actorVictim, parentSign, "aard_sign", EHRT_None, CPS_SpellPower, false, false, true, false );
		parentSign.InitSignDataForDamageAction( action );
		action.hitLocation = actorVictim.GetWorldPosition();

		if ( shouldFreeze )
		{
			// Prevent flinch/stagger animations that break the frozen ice statue pose
			action.SetHitReactionType( EHRT_None, false );
			action.SetHitAnimationPlayType( EAHA_ForceNo );
			action.RemoveBuffsByType( EET_KnockdownTypeApplicator );
			action.RemoveBuffsByType( EET_Knockdown );
			action.RemoveBuffsByType( EET_HeavyKnockdown );
			action.RemoveBuffsByType( EET_LongStagger );
			action.RemoveBuffsByType( EET_Stagger );
			action.SetBuffSourceName( "Mutation6" );

			action.AddDamage( theGame.params.DAMAGE_NAME_FORCE, 30.0f );
			action.AddDamage( theGame.params.DAMAGE_NAME_FROST, 20.0f );
		}
		else
		{
			action.SetHitReactionType( EHRT_Heavy, false );

			signPower = casterActor.GetTotalSignSpellPower( parentSign.GetSkill() );
			forceDmg = CalculateAttributeValue( signPower );
			if ( forceDmg <= 0 )
			{
				forceDmg = 80.0f;
			}
			action.AddDamage( theGame.params.DAMAGE_NAME_FORCE, forceDmg );
		}

		theGame.damageMgr.ProcessAction( action );

		if ( projectile )
		{
			( (W3AardProjectile)projectile ).AddHitEntity( actorVictim );
			if ( shouldFreeze )
			{
				actorVictim.OnFrostHit( (W3AardProjectile)projectile );
			}
			else
			{
				actorVictim.OnAardHit( (W3AardProjectile)projectile );
			}
		}
	}

	// 4. Environmental destruction & fire extinguishing across full range
	FindGameplayEntitiesInRange( envEntities, casterActor, distance, 60 );
	headingAngle = VecHeading( heading );
	for ( i = 0; i < envEntities.Size(); i += 1 )
	{
		envEntity = envEntities[i];
		if ( !envEntity || envEntity == casterActor || ( (CActor)envEntity ) )
		{
			continue;
		}

		diffVec = envEntity.GetWorldPosition() - spawnPos;
		angleToObj = AbsF( AngleDistance( headingAngle, VecHeading(diffVec) ) );

		if ( aardRangeMode == 3 || angleToObj <= coneAngle * 0.5f )
		{
			if ( projectile )
			{
				envEntity.OnAardHit( (W3AardProjectile)projectile );
				if ( freezeChance > 0 )
				{
					envEntity.OnFrostHit( (W3AardProjectile)projectile );
				}
			}
		}
	}
}

function ModCheats_ApplyAardVisuals( parentSign : W3SignEntity, casterOwner : W3SignOwner, spawnPos : Vector, spawnRot : EulerAngles, heading : Vector, distance : float, coneAngle : float, aardRangeMode : int )
{
	var casterActor : CActor;
	var signTemplate, iceSpikesTemplate : CEntityTemplate;
	var sideSign : W3AardEntity;
	var spikeEnt : CEntity;
	var rot : EulerAngles;
	var i, j, numAxes, numSteps, freezeChance : int;
	var axisDir, spikePos : Vector;
	var currentDist, stepDist : float;
	var hasFreezeVisuals : bool;

	freezeChance = ModCheats_GetAardFreezeChance();
	if ( !parentSign || !casterOwner || ( aardRangeMode == 0 && freezeChance == 0 && !GetWitcherPlayer().IsMutationActive( EPMT_Mutation6 ) ) )
	{
		return;
	}

	casterActor = casterOwner.GetActor();
	if ( !casterActor )
	{
		return;
	}

	hasFreezeVisuals = ( freezeChance > 0 || ( ( W3PlayerWitcher )casterOwner.GetPlayer() && GetWitcherPlayer().IsMutationActive( EPMT_Mutation6 ) ) );
	if ( hasFreezeVisuals )
	{
		thePlayer.PlayEffect( 'mutation_6_power' );
		iceSpikesTemplate = (CEntityTemplate)LoadResource('ice_spikes');
	}

	signTemplate = GetWitcherPlayer().GetSignTemplate(ST_Aard);

	if ( aardRangeMode == 1 )
	{
		if ( hasFreezeVisuals )
		{
			parentSign.PlayEffect( 'cone_ground_mutation_6' );
			theGame.GetSurfacePostFX().AddSurfacePostFXGroup( spawnPos + heading * 6.0, 0.3f, 3.0f, 1.5f, 10.0f, 0 );
		}
		else
		{
			parentSign.PlayEffect( 'cone_ground' );
		}

		numAxes = 3;
		numSteps = 2;
		stepDist = 6.0f;

		for ( i = 0; i < numAxes; i += 1 )
		{
			rot = spawnRot;
			if ( i == 0 ) rot.Yaw -= 35.0;
			else if ( i == 2 ) rot.Yaw += 35.0;
			axisDir = RotForward(rot);

			if ( ( i == 0 || i == 2 ) && signTemplate )
			{
				sideSign = (W3AardEntity)theGame.CreateEntity( signTemplate, spawnPos, rot );
				if ( sideSign )
				{
					sideSign.Init( casterOwner, parentSign, true, true );
					sideSign.PlayEffect( 'cone' );
					if ( hasFreezeVisuals )
					{
						sideSign.PlayEffect( 'cone_ground_mutation_6' );
					}
					sideSign.DestroyAfter( 0.7 );
				}
			}

			if ( hasFreezeVisuals && iceSpikesTemplate )
			{
				for ( j = 1; j <= numSteps; j += 1 )
				{
					currentDist = ( (float)j ) * stepDist;
					spikePos = spawnPos + axisDir * currentDist;
					spikePos = TraceFloor( spikePos );
					spikeEnt = theGame.CreateEntity( iceSpikesTemplate, spikePos, rot );
					if ( spikeEnt ) spikeEnt.DestroyAfter( 1.4 );
				}
			}
		}
	}
	else if ( aardRangeMode == 2 )
	{
		if ( hasFreezeVisuals )
		{
			parentSign.PlayEffect( 'cone_ground_mutation_6' );
			theGame.GetSurfacePostFX().AddSurfacePostFXGroup( spawnPos + heading * 10.0, 0.3f, 3.5f, 1.5f, 16.0f, 0 );
		}
		else
		{
			parentSign.PlayEffect( 'cone_ground' );
		}

		numAxes = 5;
		numSteps = 3;
		stepDist = 7.0f;

		for ( i = 0; i < numAxes; i += 1 )
		{
			rot = spawnRot;
			if ( i == 0 ) rot.Yaw -= 60.0;
			else if ( i == 1 ) rot.Yaw -= 30.0;
			else if ( i == 3 ) rot.Yaw += 30.0;
			else if ( i == 4 ) rot.Yaw += 60.0;
			axisDir = RotForward(rot);

			if ( ( i == 0 || i == 4 ) && signTemplate )
			{
				sideSign = (W3AardEntity)theGame.CreateEntity( signTemplate, spawnPos, rot );
				if ( sideSign )
				{
					sideSign.Init( casterOwner, parentSign, true, true );
					sideSign.PlayEffect( 'cone' );
					if ( hasFreezeVisuals )
					{
						sideSign.PlayEffect( 'cone_ground_mutation_6' );
					}
					sideSign.DestroyAfter( 0.7 );
				}
			}

			if ( hasFreezeVisuals && iceSpikesTemplate )
			{
				for ( j = 1; j <= numSteps; j += 1 )
				{
					currentDist = ( (float)j ) * stepDist;
					spikePos = spawnPos + axisDir * currentDist;
					spikePos = TraceFloor( spikePos );
					spikeEnt = theGame.CreateEntity( iceSpikesTemplate, spikePos, rot );
					if ( spikeEnt ) spikeEnt.DestroyAfter( 1.4 );
				}
			}
		}
	}
	else if ( aardRangeMode == 3 )
	{
		if ( hasFreezeVisuals )
		{
			parentSign.PlayEffect( 'blast_ground_mutation_6' );
			theGame.GetSurfacePostFX().AddSurfacePostFXGroup( spawnPos, 0.3f, 4.0f, 1.5f, 18.0f, 0 );
		}
		else
		{
			parentSign.PlayEffect( 'blast_ground' );
		}

		numAxes = 6;
		numSteps = 2;
		stepDist = 7.5f;

		for ( i = 0; i < numAxes; i += 1 )
		{
			rot = spawnRot;
			rot.Yaw += ( (float)i ) * 60.0f;
			axisDir = RotForward(rot);

			if ( ( i == 1 || i == 3 || i == 5 ) && signTemplate )
			{
				sideSign = (W3AardEntity)theGame.CreateEntity( signTemplate, spawnPos, rot );
				if ( sideSign )
				{
					sideSign.Init( casterOwner, parentSign, true, true );
					sideSign.PlayEffect( 'cone' );
					if ( hasFreezeVisuals )
					{
						sideSign.PlayEffect( 'cone_ground_mutation_6' );
					}
					sideSign.DestroyAfter( 0.7 );
				}
			}

			if ( hasFreezeVisuals && iceSpikesTemplate )
			{
				for ( j = 1; j <= numSteps; j += 1 )
				{
					currentDist = ( (float)j ) * stepDist;
					spikePos = spawnPos + axisDir * currentDist;
					spikePos = TraceFloor( spikePos );
					spikeEnt = theGame.CreateEntity( iceSpikesTemplate, spikePos, rot );
					if ( spikeEnt ) spikeEnt.DestroyAfter( 1.4 );
				}
			}
		}
	}
	else if ( aardRangeMode == 0 && hasFreezeVisuals )
	{
		parentSign.PlayEffect( 'cone_ground_mutation_6' );
		theGame.GetSurfacePostFX().AddSurfacePostFXGroup( spawnPos + heading * 4.0, 0.3f, 2.5f, 1.2f, 8.0f, 0 );
		if ( iceSpikesTemplate )
		{
			for ( j = 1; j <= 2; j += 1 )
			{
				currentDist = ( (float)j ) * 3.5f;
				spikePos = spawnPos + RotForward(spawnRot) * currentDist;
				spikePos = TraceFloor( spikePos );
				spikeEnt = theGame.CreateEntity( iceSpikesTemplate, spikePos, spawnRot );
				if ( spikeEnt ) spikeEnt.DestroyAfter( 1.2 );
			}
		}
	}
}

function ModCheats_GetRunesMultiplierMode() : int
{
	var config : CInGameConfigWrapper;
	var valStr : string;
	var val : int;
	
	config = theGame.GetInGameConfigWrapper();
	if ( config )
	{
		valStr = ModCheats_GetConfigValue('CheatsProgression', 'CheatRunesMultiplier');
		val = StringToInt(valStr, 0);
		if ( val >= 0 && val <= 5 )
		{
			return val;
		}
	}
	return 0;
}

function ModCheats_GetRunesMultiplier() : float
{
	var mode : int;
	mode = ModCheats_GetRunesMultiplierMode();
	switch (mode)
	{
		case 1:  return 2.0;
		case 2:  return 3.0;
		case 3:  return 5.0;
		case 4:  return 10.0;
		case 5:  return 10.0;
		default: return 1.0;
	}
}

function ModCheats_IsRuneInstaProc() : bool
{
	return ModCheats_GetRunesMultiplierMode() == 5;
}

function ModCheats_GetRuneMultiplierLabel() : string
{
	var mode : int;
	mode = ModCheats_GetRunesMultiplierMode();
	switch (mode)
	{
		case 1:  return "2x (+100% к эффектам)";
		case 2:  return "3x (+200% к эффектам)";
		case 3:  return "5x (+400% к эффектам)";
		case 4:  return "10x (+900% к эффектам)";
		case 5:  return "100% Шанс (Абсолют)";
		default: return "1x (Стандарт)";
	}
}

function ModCheats_ApplyRuneStatsToTooltip(out itemStats : array<SAttributeTooltip>, out additionalDesc : string)
{
	var mode : int;
	var mult : float;
	var i : int;
	var tagStr : string;
	
	mode = ModCheats_GetRunesMultiplierMode();
	if ( mode <= 0 )
	{
		return;
	}
	
	mult = ModCheats_GetRunesMultiplier();
	if ( mode == 5 )
	{
		tagStr = " <font color=\"#19D900\">(100% Мод)</font>";
		additionalDesc += "<br/><font color=\"#19D900\">[ЧИТ-МОД: 100% Шанс срабатывания эффекта с каждого удара]</font>";
	}
	else
	{
		tagStr = " <font color=\"#19D900\">(" + (int)mult + "x Мод)</font>";
		additionalDesc += "<br/><font color=\"#19D900\">[ЧИТ-МОД: Сила рунного камня увеличена в " + (int)mult + "x]</font>";
	}
	
	for (i = 0; i < itemStats.Size(); i += 1)
	{
		if ( mode == 5 && itemStats[i].percentageValue )
		{
			itemStats[i].value = 1.0;
		}
		else
		{
			itemStats[i].value *= mult;
		}
		itemStats[i].attributeColor = "#19D900";
		itemStats[i].attributeName += tagStr;
	}
}

function ModCheats_ApplyRuneBuffChance(baseChance : float) : float
{
	var mode : int;
	mode = ModCheats_GetRunesMultiplierMode();
	if ( mode <= 0 )
	{
		return baseChance;
	}
	if ( mode == 5 )
	{
		return 1.0;
	}
	return MinF(1.0, baseChance * ModCheats_GetRunesMultiplier());
}

function ModCheats_GetRuneCountOnWeapon(inv : CInventoryComponent, itemId : SItemUniqueId, runeTagOrPrefix : string) : int
{
	var runes : array<name>;
	var i, count : int;
	var rName : string;
	
	if ( !inv || !inv.IsIdValid(itemId) )
	{
		return 0;
	}
		
	inv.GetItemEnhancementItems(itemId, runes);
	for (i = 0; i < runes.Size(); i += 1)
	{
		rName = StrLower(NameToString(runes[i]));
		if ( StrFindFirst(rName, StrLower(runeTagOrPrefix)) >= 0 )
		{
			count += 1;
		}
	}
	return count;
}

function ModCheats_GetPlayerActiveSwordId() : SItemUniqueId
{
	var witcher : W3PlayerWitcher;
	var sword : SItemUniqueId;
	witcher = GetWitcherPlayer();
	if ( !witcher )
	{
		return sword;
	}
	sword = witcher.GetHeldSword();
	if ( witcher.inv.IsIdValid(sword) )
	{
		return sword;
	}
	sword = witcher.GetEquippedSword(false);
	if ( witcher.inv.IsIdValid(sword) )
	{
		return sword;
	}
	return witcher.GetEquippedSword(true);
}

function ModCheats_GetGlyphCountOnArmor(inv : CInventoryComponent, glyphTagOrPrefix : string) : int
{
	var slots : array<EEquipmentSlots>;
	var i, j, count : int;
	var itemId : SItemUniqueId;
	var enhancements : array<name>;
	var rName : string;
	
	if ( !inv )
	{
		return 0;
	}
	
	slots.PushBack(EES_Armor);
	slots.PushBack(EES_Pants);
	slots.PushBack(EES_Boots);
	slots.PushBack(EES_Gloves);
	
	for (i = 0; i < slots.Size(); i += 1)
	{
		if ( inv.GetItemEquippedOnSlot(slots[i], itemId) && inv.IsIdValid(itemId) )
		{
			enhancements.Clear();
			inv.GetItemEnhancementItems(itemId, enhancements);
			for (j = 0; j < enhancements.Size(); j += 1)
			{
				rName = StrLower(NameToString(enhancements[j]));
				if ( StrFindFirst(rName, StrLower(glyphTagOrPrefix)) >= 0 )
				{
					count += 1;
				}
			}
		}
	}
	return count;
}

function ModCheats_ProcessRuneBoost(victim : CActor, optional weaponId : SItemUniqueId)
{
	var mode : int;
	var mult : float;
	var inv : CInventoryComponent;
	var sword : SItemUniqueId;
	var devanaCount, dazhbogCount, moranaCount, triglavCount, zoriaCount, stribogCount : int;
	var hasDevana, hasDazhbog, hasMorana, hasTriglav, hasZoria, hasStribog : bool;
	var hasAnyRuneOrInnate : bool;
	var bleedVal, burnVal, poisonVal, freezeVal, staggerVal, kdVal : SAbilityAttributeValue;
	var npc : CNewNPC;
	var combatStorage : CBaseAICombatStorage;
	var freezeParams, effectParams : SCustomEffectParams;
	var animComp : CAnimatedComponent;
	
	mode = ModCheats_GetRunesMultiplierMode();
	if ( mode <= 0 || !victim || !victim.IsAlive() )
	{
		return;
	}
	
	inv = thePlayer.GetInventory();
	if ( !inv )
	{
		return;
	}
	
	sword = weaponId;
	if ( !inv.IsIdValid(sword) )
	{
		return;
	}
	
	mult = ModCheats_GetRunesMultiplier();
	
	if ( inv.IsIdValid(sword) )
	{
		devanaCount  = ModCheats_GetRuneCountOnWeapon(inv, sword, "devana");
		dazhbogCount = ModCheats_GetRuneCountOnWeapon(inv, sword, "dazhbog");
		moranaCount  = ModCheats_GetRuneCountOnWeapon(inv, sword, "morana");
		triglavCount = ModCheats_GetRuneCountOnWeapon(inv, sword, "triglav");
		zoriaCount   = ModCheats_GetRuneCountOnWeapon(inv, sword, "zoria");
		stribogCount = ModCheats_GetRuneCountOnWeapon(inv, sword, "stribog");
		
		bleedVal   = inv.GetItemAttributeValue(sword, 'bleeding_chance');
		burnVal    = inv.GetItemAttributeValue(sword, 'burning_chance');
		poisonVal  = inv.GetItemAttributeValue(sword, 'poison_chance');
		freezeVal  = inv.GetItemAttributeValue(sword, 'freeze_chance');
		staggerVal = inv.GetItemAttributeValue(sword, 'stagger_chance');
		kdVal      = inv.GetItemAttributeValue(sword, 'knockdown_chance');
	}
	
	hasAnyRuneOrInnate = ( devanaCount > 0 || dazhbogCount > 0 || moranaCount > 0 || triglavCount > 0 || zoriaCount > 0 || stribogCount > 0
		|| bleedVal.valueAdditive > 0 || bleedVal.valueBase > 0
		|| burnVal.valueAdditive > 0 || burnVal.valueBase > 0
		|| poisonVal.valueAdditive > 0 || poisonVal.valueBase > 0
		|| freezeVal.valueAdditive > 0 || freezeVal.valueBase > 0
		|| staggerVal.valueAdditive > 0 || staggerVal.valueBase > 0
		|| kdVal.valueAdditive > 0 || kdVal.valueBase > 0 );
	
	// Bleeding (Devana)
	if ( devanaCount > 0 || bleedVal.valueAdditive > 0 || bleedVal.valueBase > 0 )
	{
		if ( mode == 5 || RandF() < MinF(1.0, MaxF(0.05 * (float)devanaCount, CalculateAttributeValue(bleedVal)) * mult) )
		{
			hasDevana = true;
		}
	}
	
	// Burning (Dazhbog)
	if ( dazhbogCount > 0 || burnVal.valueAdditive > 0 || burnVal.valueBase > 0 )
	{
		if ( mode == 5 || RandF() < MinF(1.0, MaxF(0.05 * (float)dazhbogCount, CalculateAttributeValue(burnVal)) * mult) )
		{
			hasDazhbog = true;
		}
	}
	
	// Poison (Morana)
	if ( moranaCount > 0 || poisonVal.valueAdditive > 0 || poisonVal.valueBase > 0 )
	{
		if ( mode == 5 || RandF() < MinF(1.0, MaxF(0.05 * (float)moranaCount, CalculateAttributeValue(poisonVal)) * mult) )
		{
			hasMorana = true;
		}
	}
	
	// Stagger (Triglav)
	if ( triglavCount > 0 || staggerVal.valueAdditive > 0 || staggerVal.valueBase > 0 )
	{
		if ( mode == 5 || RandF() < MinF(1.0, MaxF(0.05 * (float)triglavCount, CalculateAttributeValue(staggerVal)) * mult) )
		{
			hasTriglav = true;
		}
	}
	
	// Freeze (Zoria)
	if ( zoriaCount > 0 || freezeVal.valueAdditive > 0 || freezeVal.valueBase > 0 )
	{
		if ( mode == 5 || RandF() < MinF(1.0, MaxF(0.05 * (float)zoriaCount, CalculateAttributeValue(freezeVal)) * mult) )
		{
			hasZoria = true;
		}
	}
	
	// Knockdown (Stribog)
	if ( stribogCount > 0 || kdVal.valueAdditive > 0 || kdVal.valueBase > 0 )
	{
		if ( mode == 5 || RandF() < MinF(1.0, MaxF(0.05 * (float)stribogCount, CalculateAttributeValue(kdVal)) * mult) )
		{
			hasStribog = true;
		}
	}
	
	// Apply Freezing (Zoria)
	if ( hasZoria && victim.IsAlive() )
	{
		npc = (CNewNPC)victim;
		if ( npc )
		{
			combatStorage = (CBaseAICombatStorage)npc.GetScriptStorageObject('CombatData');
			if ( combatStorage )
			{
				combatStorage.SetIsInImportantAnim( false );
			}
		}

		victim.RemoveAllBuffsOfType( EET_Knockdown );
		victim.RemoveAllBuffsOfType( EET_KnockdownTypeApplicator );
		victim.RemoveAllBuffsOfType( EET_Ragdoll );
		victim.RemoveAllBuffsOfType( EET_LongStagger );
		victim.RemoveAllBuffsOfType( EET_Stagger );

		freezeParams.effectType = EET_Frozen;
		freezeParams.creator = thePlayer;
		freezeParams.sourceName = "RuneZoria";
		freezeParams.duration = 4.0f;
		freezeParams.isSignEffect = false;
		victim.AddEffectCustom( freezeParams );

		victim.AddEffectDefault( EET_SlowdownFrost, thePlayer, "RuneZoria", false );
		
		animComp = (CAnimatedComponent)victim.GetComponentByClassName('CAnimatedComponent');
		if ( animComp )
		{
			animComp.FreezePose();
		}
	}
	
	// Apply Bleeding (Devana)
	if ( hasDevana && victim.IsAlive() )
	{
		effectParams.effectType = EET_Bleeding;
		effectParams.creator = thePlayer;
		effectParams.sourceName = "RuneDevana";
		effectParams.duration = 10.0f;
		effectParams.isSignEffect = false;
		victim.AddEffectCustom( effectParams );
	}
	
	// Apply Burning (Dazhbog)
	if ( hasDazhbog && victim.IsAlive() )
	{
		effectParams.effectType = EET_Burning;
		effectParams.creator = thePlayer;
		effectParams.sourceName = "RuneDazhbog";
		effectParams.duration = 5.0f;
		effectParams.isSignEffect = false;
		victim.AddEffectCustom( effectParams );
	}
	
	// Apply Poison (Morana)
	if ( hasMorana && victim.IsAlive() )
	{
		effectParams.effectType = EET_Poison;
		effectParams.creator = thePlayer;
		effectParams.sourceName = "RuneMorana";
		effectParams.duration = 10.0f;
		effectParams.isSignEffect = false;
		victim.AddEffectCustom( effectParams );
	}
	
	// Apply Stagger (Triglav)
	if ( hasTriglav && victim.IsAlive() && !hasZoria )
	{
		effectParams.effectType = EET_LongStagger;
		effectParams.creator = thePlayer;
		effectParams.sourceName = "RuneTriglav";
		effectParams.duration = 2.5f;
		effectParams.isSignEffect = false;
		victim.AddEffectCustom( effectParams );
	}
	
	// Apply Knockdown (Stribog)
	if ( hasStribog && victim.IsAlive() && !hasZoria )
	{
		effectParams.effectType = EET_Knockdown;
		effectParams.creator = thePlayer;
		effectParams.sourceName = "RuneStribog";
		effectParams.duration = 3.0f;
		effectParams.isSignEffect = false;
		victim.AddEffectCustom( effectParams );
	}
}

function ModCheats_UnfreezeAndRagdoll( actor : CActor )
{
	var animComp : CAnimatedComponent;
	var mac : CMovingPhysicalAgentComponent;
	var npc : CNewNPC;

	if ( !actor )
		return;

	animComp = (CAnimatedComponent)actor.GetComponentByClassName('CAnimatedComponent');
	if ( animComp )
	{
		animComp.UnfreezePose();
	}
	animComp = actor.GetRootAnimatedComponent();
	if ( animComp )
	{
		animComp.UnfreezePose();
	}

	actor.RemoveAllBuffsOfType(EET_Frozen);
	actor.RemoveAllBuffsOfType(EET_SlowdownFrost);
	actor.FreezeCloth( false );
	actor.SetKinematic( false );
	actor.EnablePhysicalMovement( true );
	actor.PauseRagdoll( false );

	mac = (CMovingPhysicalAgentComponent)actor.GetMovingAgentComponent();
	if ( mac )
	{
		mac.SetAnimatedMovement( false );
		mac.SnapToNavigableSpace( false );
	}

	npc = (CNewNPC)actor;
	if ( npc )
	{
		npc.DisableDeathAndAgony();
		npc.DisableAgony();
	}

	actor.SetBehaviorVariable( 'bCriticalState', 0.0f );
	actor.SetBehaviorVariable( 'CriticalStateType', 0.0f );
	actor.SetBehaviorVariable( 'Ragdoll_Weight', 1.0f );
	actor.SetBehaviorVariable( 'HasRagdoll', 1.0f );

	actor.SignalGameplayEventParamInt('ForceStopCriticalEffect', (int)ECST_Frozen);
	actor.RequestCriticalAnimStop();
	actor.RaiseEvent( 'CriticalStateEnded' );

	actor.TurnOnRagdoll();
	actor.RaiseForceEvent( 'Ragdoll' );
}

function ModCheats_IsMeteorBombEnabled() : bool
{
	var config : CInGameConfigWrapper;
	config = theGame.GetInGameConfigWrapper();
	if ( config )
	{
		return ModCheats_GetConfigValue('CheatsBombs', 'CheatMeteorBomb') == "true";
	}
	return false;
}

function ModCheats_GetMeteorBombMode() : int
{
	if ( ModCheats_IsMeteorBombEnabled() )
		return 1;
	return 0;
}

function ModCheats_GetMeteorCount() : int
{
	var config : CInGameConfigWrapper;
	var valStr : string;
	var mode : int;
	
	config = theGame.GetInGameConfigWrapper();
	if ( config )
	{
		valStr = ModCheats_GetConfigValue('CheatsBombs', 'CheatMeteorCount');
		mode = StringToInt(valStr, 2);
		switch ( mode )
		{
			case 0: return 5;
			case 1: return 10;
			case 2: return 15;
			case 3: return 20;
			case 4: return 30;
			case 5: return 50;
			default: return 15;
		}
	}
	return 15;
}

function ModCheats_GetMeteorRadius() : float
{
	var config : CInGameConfigWrapper;
	var valStr : string;
	var mode : int;
	
	config = theGame.GetInGameConfigWrapper();
	if ( config )
	{
		valStr = ModCheats_GetConfigValue('CheatsBombs', 'CheatMeteorRadius');
		mode = StringToInt(valStr, 1);
		switch ( mode )
		{
			case 0: return 10.0f;
			case 1: return 20.0f;
			case 2: return 35.0f;
			case 3: return 50.0f;
			case 4: return 100.0f;
			default: return 20.0f;
		}
	}
	return 20.0f;
}

function ModCheats_IsInfiniteBombsEnabled() : bool
{
	var config : CInGameConfigWrapper;
	
	config = theGame.GetInGameConfigWrapper();
	if ( config )
	{
		return ModCheats_GetConfigValue('CheatsBombs', 'CheatInfiniteBombs') == "true";
	}
	return false;
}

function ModCheats_GiveGrapeshotBomb()
{
	var ids : array<SItemUniqueId>;
	var witcher : W3PlayerWitcher;
	var bombId : SItemUniqueId;
	var maxAmmo : int;
	var nullId : SItemUniqueId;

	if ( !thePlayer || !thePlayer.inv )
		return;

	witcher = GetWitcherPlayer();

	if ( witcher )
	{
		witcher.AddAlchemyRecipe( 'Recipe for Grapeshot 1' );
		witcher.AddAlchemyRecipe( 'Recipe for Grapeshot 2' );
		witcher.AddAlchemyRecipe( 'Recipe for Grapeshot 3' );
	}

	ids = thePlayer.inv.GetItemsByName( 'Grapeshot 3' );
	if ( ids.Size() > 0 )
	{
		bombId = ids[0];
	}
	else
	{
		ids = thePlayer.inv.AddAnItem( 'Grapeshot 3', 1 );
		if ( ids.Size() > 0 )
		{
			bombId = ids[0];
		}
		else
		{
			ids = thePlayer.inv.GetItemsByName( 'Grapeshot 3' );
			if ( ids.Size() > 0 )
			{
				bombId = ids[0];
			}
		}
	}

	if ( bombId == nullId )
	{
		ids = thePlayer.inv.GetItemsByName( 'Grapeshot 1' );
		if ( ids.Size() == 0 )
			ids = thePlayer.inv.AddAnItem( 'Grapeshot 1', 1 );
		if ( ids.Size() == 0 )
			ids = thePlayer.inv.GetItemsByName( 'Grapeshot 1' );
		if ( ids.Size() > 0 )
			bombId = ids[0];
	}

	if ( bombId != nullId )
	{
		maxAmmo = thePlayer.inv.SingletonItemGetMaxAmmo( bombId );
		if ( maxAmmo <= 0 )
			maxAmmo = 5;

		thePlayer.inv.SingletonItemSetAmmo( bombId, maxAmmo );

		if ( witcher )
		{
			witcher.EquipItem( bombId, EES_Petard1 );
			witcher.SelectQuickslotItem( EES_Petard1 );
		}
		theGame.GetGuiManager().ShowNotification( "Отличная Картечь готова и экипирована (" + maxAmmo + " шт)!" );
	}
}

function ModCheats_EnsureGrapeshotReady()
{
	var ids : array<SItemUniqueId>;
	var bombId, equippedBomb : SItemUniqueId;
	var maxAmmo : int;
	var witcher : W3PlayerWitcher;

	if ( !thePlayer || !thePlayer.inv )
		return;

	witcher = GetWitcherPlayer();

	ids = thePlayer.inv.GetItemsByName( 'Grapeshot 3' );
	if ( ids.Size() == 0 )
	{
		ModCheats_GiveGrapeshotBomb();
		return;
	}

	bombId = ids[0];
	maxAmmo = thePlayer.inv.SingletonItemGetMaxAmmo( bombId );
	if ( maxAmmo <= 0 )
		maxAmmo = 5;

	if ( thePlayer.inv.SingletonItemGetAmmo( bombId ) <= 0 )
	{
		thePlayer.inv.SingletonItemSetAmmo( bombId, maxAmmo );
	}

	if ( !thePlayer.inv.GetItemEquippedOnSlot( EES_Petard1, equippedBomb ) || equippedBomb != bombId )
	{
		if ( witcher )
		{
			witcher.EquipItem( bombId, EES_Petard1 );
			witcher.SelectQuickslotItem( EES_Petard1 );
		}
	}
}

exec function givegrapeshot()
{
	ModCheats_GiveGrapeshotBomb();
}

exec function addbomb()
{
	ModCheats_GiveGrapeshotBomb();
}

function ModCheats_SpawnMeteorStorm( centerPos : Vector )
{
	var template : CEntityTemplate;
	var i, count : int;
	var radius : float;
	var entity : CEntity;
	var meteorite : W3MeteorProjectile;
	var targetPos, spawnPos : Vector;
	var rotation : EulerAngles;
	var collisionGroups : array<name>;
	var dist : float;

	if ( !ModCheats_IsMeteorBombEnabled() )
		return;

	count = ModCheats_GetMeteorCount();
	radius = ModCheats_GetMeteorRadius();

	template = (CEntityTemplate)LoadResource( 'eredin_meteorite' );
	if ( !template )
		return;

	collisionGroups.PushBack( 'Terrain' );
	collisionGroups.PushBack( 'Static' );

	for ( i = 0; i < count; i += 1 )
	{
		targetPos = centerPos;
		dist = RandRangeF( radius, 1.5f );
		targetPos += VecRingRand( 1.0f, dist );

		spawnPos = targetPos;
		spawnPos.X += RandRangeF( 15.0f, -15.0f );
		spawnPos.Y += RandRangeF( 35.0f, 15.0f );
		spawnPos.Z += 45.0f + ( (float)i * RandRangeF( 3.0f, 1.2f ) );

		rotation.Yaw = RandRangeF( 180.0f, -180.0f );

		entity = theGame.CreateEntity( template, spawnPos, rotation );
		meteorite = (W3MeteorProjectile)entity;
		if ( meteorite )
		{
			meteorite.Init( thePlayer );
			meteorite.decreasePlayerDmgBy = 1.0f;
			meteorite.explosionRadius = 6.0f;
			meteorite.projSpeed = RandRangeF( 32.0f, 24.0f );
			meteorite.projDMG = MaxF( 1200.0f, (float)thePlayer.GetLevel() * 120.0f );

			meteorite.ShootProjectileAtPosition( meteorite.projAngle, meteorite.projSpeed, targetPos, 500.0f, collisionGroups );
		}
	}

	GCameraShake( 2.5f, true, centerPos, radius + 20.0f );
}

function ModCheats_GetGeraltMeteorMode() : int
{
	var valStr : string;
	var mode : int;
	valStr = ModCheats_GetConfigValue('CheatsBombs', 'CheatGeraltMeteorMode');
	mode = StringToInt(valStr, 0);
	if ( mode >= 0 && mode <= 2 )
		return mode;
	return 0;
}

function ModCheats_GetGeraltMeteorRadius() : float
{
	var valStr : string;
	var mode : int;
	valStr = ModCheats_GetConfigValue('CheatsBombs', 'CheatGeraltMeteorRadius');
	mode = StringToInt(valStr, 1);
	switch ( mode )
	{
		case 0: return 15.0f;
		case 1: return 25.0f;
		case 2: return 40.0f;
		case 3: return 60.0f;
		case 4: return 100.0f;
		default: return 25.0f;
	}
	return 25.0f;
}

function ModCheats_GetGeraltMeteorInterval() : float
{
	var valStr : string;
	var mode : int;
	valStr = ModCheats_GetConfigValue('CheatsBombs', 'CheatGeraltMeteorInterval');
	mode = StringToInt(valStr, 1);
	switch ( mode )
	{
		case 0: return 1.0f;
		case 1: return 2.0f;
		case 2: return 4.0f;
		case 3: return 7.0f;
		default: return 2.0f;
	}
	return 2.0f;
}

function ModCheats_SpawnSingleMeteorNearGeralt( maxRadius : float )
{
	var template : CEntityTemplate;
	var entity : CEntity;
	var meteorite : W3MeteorProjectile;
	var centerPos, targetPos, spawnPos : Vector;
	var rotation : EulerAngles;
	var collisionGroups : array<name>;
	var dist : float;
	var targetEntity : CActor;

	if ( !thePlayer || !thePlayer.IsAlive() )
		return;

	template = (CEntityTemplate)LoadResource( 'eredin_meteorite' );
	if ( !template )
		return;

	centerPos = thePlayer.GetWorldPosition();
	collisionGroups.PushBack( 'Terrain' );
	collisionGroups.PushBack( 'Static' );

	targetEntity = (CActor)thePlayer.GetTarget();
	if ( targetEntity && targetEntity.IsAlive() && VecDistance( centerPos, targetEntity.GetWorldPosition() ) <= maxRadius && RandRange(100) < 65 )
	{
		targetPos = targetEntity.GetWorldPosition() + VecRingRand( 0.5f, 3.5f );
	}
	else
	{
		dist = RandRangeF( maxRadius, 4.0f );
		targetPos = centerPos + VecRingRand( 3.5f, dist );
	}

	spawnPos = targetPos;
	spawnPos.X += RandRangeF( 12.0f, -12.0f );
	spawnPos.Y += RandRangeF( 25.0f, 12.0f );
	spawnPos.Z += RandRangeF( 45.0f, 35.0f );

	rotation.Yaw = RandRangeF( 180.0f, -180.0f );

	entity = theGame.CreateEntity( template, spawnPos, rotation );
	meteorite = (W3MeteorProjectile)entity;
	if ( meteorite )
	{
		meteorite.Init( thePlayer );
		meteorite.decreasePlayerDmgBy = 1.0f;
		meteorite.explosionRadius = 6.0f;
		meteorite.projSpeed = RandRangeF( 32.0f, 24.0f );
		meteorite.projDMG = MaxF( 1200.0f, (float)thePlayer.GetLevel() * 120.0f );

		meteorite.ShootProjectileAtPosition( meteorite.projAngle, meteorite.projSpeed, targetPos, 500.0f, collisionGroups );
	}

	GCameraShake( 1.2f, true, targetPos, 25.0f );
}

function ModCheats_GetCrossbowDamageMode() : int
{
	var valStr : string;
	valStr = ModCheats_GetConfigValue('CheatsCrossbow', 'CheatCrossbowDamage');
	if ( valStr != "" )
	{
		return StringToInt( valStr );
	}
	return 0;
}

function ModCheats_IsCrossbowInfinite() : bool
{
	var valStr : string;
	valStr = ModCheats_GetConfigValue('CheatsCrossbow', 'CheatCrossbowInfinite');
	return ( valStr == "1" || valStr == "true" );
}

function ModCheats_GetCrossbowVolleyMode() : int
{
	var valStr : string;
	valStr = ModCheats_GetConfigValue('CheatsCrossbow', 'CheatCrossbowVolley');
	if ( valStr != "" )
	{
		return StringToInt( valStr );
	}
	return 0;
}

function ModCheats_GetCrossbowImpactEffect() : int
{
	var valStr : string;
	valStr = ModCheats_GetConfigValue('CheatsCrossbow', 'CheatCrossbowImpactEffect');
	if ( valStr != "" )
	{
		return StringToInt( valStr );
	}
	return 0;
}

function ModCheats_ApplyCrossbowImpactEffect( victim : CActor, hitPos : Vector )
{
	var effectMode : int;
	var targetPos : Vector;
	var template : CEntityTemplate;
	var entity : CEntity;
	var meteorite : W3MeteorProjectile;
	var spawnPos : Vector;
	var rotation : EulerAngles;
	var collisionGroups : array<name>;
	var spikeEnt : CEntity;
	var i : int;
	var angle, radius : float;
	var nearbyActors : array<CActor>;
	var effectParams : SCustomEffectParams;
	var curActor : CActor;

	effectMode = ModCheats_GetCrossbowImpactEffect();
	if ( effectMode <= 0 )
	{
		return;
	}

	if ( hitPos != Vector( 0.0f, 0.0f, 0.0f ) )
	{
		targetPos = hitPos;
	}
	else if ( victim )
	{
		targetPos = victim.GetWorldPosition();
	}
	else
	{
		return;
	}

	// 1: Meteor Strike from Sky
	if ( effectMode == 1 )
	{
		template = (CEntityTemplate)LoadResource( 'eredin_meteorite' );
		if ( template )
		{
			collisionGroups.PushBack( 'Terrain' );
			collisionGroups.PushBack( 'Static' );
			collisionGroups.PushBack( 'Destructible' );
			collisionGroups.PushBack( 'Character' );
			collisionGroups.PushBack( 'Ragdoll' );
			
			spawnPos = targetPos;
			spawnPos.X += RandRangeF( 1.5f, -1.5f );
			spawnPos.Y += RandRangeF( 1.5f, -1.5f );
			spawnPos.Z += 28.0f;
			
			entity = theGame.CreateEntity( template, spawnPos, rotation );
			meteorite = (W3MeteorProjectile)entity;
			if ( meteorite )
			{
				meteorite.Init( thePlayer );
				meteorite.decreasePlayerDmgBy = 1.0f;
				meteorite.explosionRadius = 6.0f;
				meteorite.projSpeed = 45.0f;
				meteorite.projDMG = MaxF( 1500.0f, (float)thePlayer.GetLevel() * 150.0f );
				meteorite.ShootProjectileAtPosition( 0.0f, meteorite.projSpeed, targetPos, 500.0f, collisionGroups );
			}
			GCameraShake( 1.5f, true, targetPos, 30.0f );
		}
	}
	// 2: Freeze Statues (ice_spikes + EET_Frozen + frost decal)
	else if ( effectMode == 2 )
	{
		template = (CEntityTemplate)LoadResource( 'ice_spikes_large' );
		if ( template )
		{
			spikeEnt = theGame.CreateEntity( template, targetPos, rotation );
			if ( spikeEnt )
			{
				spikeEnt.DestroyAfter( 8.0f );
			}
		}
		template = (CEntityTemplate)LoadResource( 'ice_spikes' );
		if ( template )
		{
			for ( i = 0; i < 3; i += 1 )
			{
				angle = Deg2Rad( (float)i * 120.0f + RandRangeF( 25.0f, -25.0f ) );
				radius = RandRangeF( 2.2f, 1.0f );
				spawnPos = targetPos;
				spawnPos.X += CosF( angle ) * radius;
				spawnPos.Y += SinF( angle ) * radius;
				
				spikeEnt = theGame.CreateEntity( template, spawnPos, rotation );
				if ( spikeEnt )
				{
					spikeEnt.DestroyAfter( 6.0f );
				}
			}
		}

		theGame.GetSurfacePostFX().AddSurfacePostFXGroup( targetPos, 0.5f, 6.0f, 2.0f, 5.0f, 2 );
		GCameraShake( 1.5f, true, targetPos, 25.0f );

		if ( victim && victim.IsAlive() )
		{
			effectParams.effectType = EET_Frozen;
			effectParams.creator = thePlayer;
			effectParams.sourceName = "crossbow_freeze";
			effectParams.duration = 10.0f;
			victim.AddEffectCustom( effectParams );
		}

		nearbyActors = GetActorsInRange( thePlayer, 60.0f, 30, '', true );
		for ( i = 0; i < nearbyActors.Size(); i += 1 )
		{
			curActor = nearbyActors[i];
			if ( curActor && curActor != thePlayer && curActor.IsAlive() )
			{
				if ( VecDistance( targetPos, curActor.GetWorldPosition() ) <= 6.5f )
				{
					effectParams.effectType = EET_Frozen;
					effectParams.creator = thePlayer;
					effectParams.sourceName = "crossbow_freeze";
					effectParams.duration = 10.0f;
					curActor.AddEffectCustom( effectParams );
				}
			}
		}
	}
}

function ModCheats_GiveCrossbowKit( witcher : W3PlayerWitcher )
{
	var cbIds, cbIds2 : array<SItemUniqueId>;
	var boltIds : array<SItemUniqueId>;
	var equippedItem : SItemUniqueId;

	if ( !witcher || !witcher.inv )
		return;

	cbIds = witcher.inv.AddAnItem( 'Lynx School Crossbow', 1 );
	cbIds2 = witcher.inv.AddAnItem( 'Crossbow 1', 1 );
	boltIds = witcher.inv.AddAnItem( 'Explosive Bolt', 30 );
	witcher.inv.AddAnItem( 'Split Bolt', 30 );
	witcher.inv.AddAnItem( 'Broadhead Bolt', 30 );
	witcher.inv.AddAnItem( 'Blunt Bolt', 30 );
	witcher.inv.AddAnItem( 'Tracking Bolt', 30 );

	if ( !witcher.GetItemEquippedOnSlot( EES_RangedWeapon, equippedItem ) )
	{
		if ( cbIds.Size() > 0 )
		{
			witcher.EquipItem( cbIds[0] );
		}
		if ( !witcher.GetItemEquippedOnSlot( EES_RangedWeapon, equippedItem ) && cbIds2.Size() > 0 )
		{
			witcher.EquipItem( cbIds2[0] );
		}
	}

	if ( !witcher.GetItemEquippedOnSlot( EES_Bolt, equippedItem ) && boltIds.Size() > 0 )
	{
		witcher.EquipItem( boltIds[0] );
	}
}

function ModCheats_GiveSimpleCrossbow()
{
	if ( thePlayer && thePlayer.inv )
	{
		thePlayer.inv.AddAnItem( 'Crossbow 1', 1 );
		theGame.GetGuiManager().ShowNotification( "Простой арбалет добавлен в инвентарь!" );
	}
}

function ModCheats_GiveAllBoltsKit()
{
	if ( thePlayer && thePlayer.inv )
	{
		thePlayer.inv.AddAnItem( 'Explosive Bolt', 50 );
		thePlayer.inv.AddAnItem( 'Split Bolt', 50 );
		thePlayer.inv.AddAnItem( 'Broadhead Bolt', 50 );
		thePlayer.inv.AddAnItem( 'Blunt Bolt', 50 );
		thePlayer.inv.AddAnItem( 'Tracking Bolt', 50 );
		theGame.GetGuiManager().ShowNotification( "Набор специальных болтов (+50 шт. каждого) получен!" );
	}
}

exec function addcrossbow()
{
	ModCheats_GiveSimpleCrossbow();
}

function ModCheats_IsGwentWinCardRewardEnabled() : bool
{
	return ModCheats_GetConfigValue('CheatsMain', 'CheatGwentWinCardReward') == "true";
}

function ModCheats_GiveRandomGwentCardReward()
{
	var gwintMgr : CR4GwintManager;
	var dm : CDefinitionsManagerAccessor;
	var allCards : array<SCardDefinition>;
	var cardDefs : array<SCardDefinition>;
	var leaderDefs : array<SCardDefinition>;
	var pickedCard : SCardDefinition;
	var itemToAdd : name;
	var cardTitleLoc : string;
	var i, randIdx : int;
	var addedIds : array<SItemUniqueId>;

	gwintMgr = theGame.GetGwintManager();
	if ( !gwintMgr )
	{
		return;
	}

	dm = theGame.GetDefinitionsManager();

	cardDefs = gwintMgr.GetCardDefs();
	for ( i = 0; i < cardDefs.Size(); i += 1 )
	{
		allCards.PushBack( cardDefs[i] );
	}

	leaderDefs = gwintMgr.GetLeaderDefs();
	for ( i = 0; i < leaderDefs.Size(); i += 1 )
	{
		allCards.PushBack( leaderDefs[i] );
	}

	if ( allCards.Size() == 0 )
	{
		return;
	}

	randIdx = RandRange( allCards.Size(), 0 );
	pickedCard = allCards[randIdx];

	itemToAdd = pickedCard.itemName;
	if ( itemToAdd == '' && dm )
	{
		itemToAdd = dm.GetItemNameFromLocalisationKeyName( pickedCard.title );
	}

	if ( itemToAdd != '' )
	{
		// Adding card item to inventory automatically triggers inventoryComponent -> witcher.AddGwentCard,
		// which adds the card to the Gwent collection ONCE and triggers the native DisplayItemRewardNotification banner.
		addedIds = thePlayer.inv.AddAnItem( itemToAdd, 1, false, false, true );
	}

	// Fallback only if item was not found in inventory definitions or failed to add
	if ( addedIds.Size() == 0 && pickedCard.cardName != '' )
	{
		gwintMgr.AddCardToCollection( pickedCard.cardName );
		FactsAdd( "Gwint_Card_Looted" );

		cardTitleLoc = GetLocStringByKeyExt( pickedCard.title );
		if ( cardTitleLoc == "" )
		{
			cardTitleLoc = NameToString( pickedCard.cardName );
		}
		theGame.GetGuiManager().ShowNotification( GetLocStringByKeyExt( "panel_title_gwent" ) + ": " + cardTitleLoc );
	}

	cardTitleLoc = GetLocStringByKeyExt( pickedCard.title );
	if ( cardTitleLoc == "" )
	{
		if ( itemToAdd != '' )
		{
			cardTitleLoc = NameToString( itemToAdd );
		}
		else
		{
			cardTitleLoc = NameToString( pickedCard.cardName );
		}
	}

	theGame.witcherLog.AddCombatMessage( GetLocStringByKeyExt( "panel_title_gwent" ) + ": " + cardTitleLoc, NULL, thePlayer );
}

function ModCheats_EnsureCard( gwintMgr : CR4GwintManager, dm : CDefinitionsManagerAccessor, cardName : name, targetCount : int )
{
	var cardDef : SCardDefinition;
	var cardItemName : name;
	var currentCount : int;

	if ( !gwintMgr || cardName == '' )
	{
		return;
	}

	currentCount = gwintMgr.GetPlayerCardCount( cardName );
	while ( currentCount < targetCount )
	{
		gwintMgr.AddCardToCollection( cardName );
		currentCount += 1;
	}

	cardItemName = '';
	if ( gwintMgr.GetGwentCard( cardName, cardDef ) )
	{
		cardItemName = cardDef.itemName;
		if ( cardItemName == '' && dm )
		{
			cardItemName = dm.GetItemNameFromLocalisationKeyName( cardDef.title );
		}
	}

	if ( cardItemName != '' )
	{
		thePlayer.inv.AddAnItem( cardItemName, targetCount, true, true, false );
		FactsAdd( "merchant_card_" + cardItemName + "_already_given", 1, -1 );
	}
}

function ModCheats_EnsureLeader( gwintMgr : CR4GwintManager, dm : CDefinitionsManagerAccessor, leaderName : name )
{
	var cardDef : SCardDefinition;
	var cardItemName : name;

	if ( !gwintMgr || leaderName == '' )
	{
		return;
	}

	if ( gwintMgr.GetPlayerCardCount( leaderName ) < 1 )
	{
		gwintMgr.AddCardToCollection( leaderName );
	}

	cardItemName = '';
	if ( gwintMgr.GetGwentCard( leaderName, cardDef ) )
	{
		cardItemName = cardDef.itemName;
		if ( cardItemName == '' && dm )
		{
			cardItemName = dm.GetItemNameFromLocalisationKeyName( cardDef.title );
		}
	}

	if ( cardItemName != '' )
	{
		thePlayer.inv.AddAnItem( cardItemName, 1, true, true, false );
		FactsAdd( "merchant_card_" + cardItemName + "_already_given", 1, -1 );
	}
}

function ModCheats_GiveAllSkelligeCards()
{
	var gwintMgr : CR4GwintManager;
	var dm : CDefinitionsManagerAccessor;
	var skePlayerDeck : SDeckDefinition;

	gwintMgr = theGame.GetGwintManager();
	if ( !gwintMgr )
	{
		return;
	}

	dm = theGame.GetDefinitionsManager();

	if ( !gwintMgr.GetFactionDeck( GwintFaction_Skellige, skePlayerDeck ) || skePlayerDeck.leaderCard == '' )
	{
		skePlayerDeck.leaderCard = 'Crach_an_Craite';
		skePlayerDeck.specialCard = '';
		skePlayerDeck.unlocked = true;
		gwintMgr.SetFactionDeck( GwintFaction_Skellige, skePlayerDeck );
	}
	gwintMgr.UnlockDeck( GwintFaction_Skellige );
	FactsAdd( "skel_gwint_base_deck_given" );

	// Лидеры (2 карты)
	ModCheats_EnsureLeader( gwintMgr, dm, 'Crach_an_Craite' );
	ModCheats_EnsureLeader( gwintMgr, dm, 'king_bran' );

	// Герои и уникальные отряды (20 карт)
	ModCheats_EnsureCard( gwintMgr, dm, 'cerys', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'hjalmar', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'ermion', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'olaf', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'cock', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'hemdal', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'birna_bran', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'blueboy_lugos', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'madman_lugos', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'donar_an_hindar', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'holger_blackhand', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'udalryk', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'svanrige', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'draig', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'clan_dimun_pirate', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'clan_tordarroch_armorsmith', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'clan_heymaey_skald', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'berserker', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'berserker_bear', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'young_berserker_bear', 1 );

	// Отряды с полными связками по 3 копии (18 карт)
	ModCheats_EnsureCard( gwintMgr, dm, 'young_berserker', 3 );
	ModCheats_EnsureCard( gwintMgr, dm, 'clan_an_craite_warrior', 3 );
	ModCheats_EnsureCard( gwintMgr, dm, 'clan_drummond_shieldmaiden', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'clan_drummond_shieldmaiden2', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'clan_drummond_shieldmaiden3', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'clan_brokvar_archer', 3 );
	ModCheats_EnsureCard( gwintMgr, dm, 'light_drakkar', 3 );
	ModCheats_EnsureCard( gwintMgr, dm, 'war_drakkar', 3 );

	// Фракционные спецкарты Скеллиге (6 карт)
	ModCheats_EnsureCard( gwintMgr, dm, 'mushroom', 3 );
	ModCheats_EnsureCard( gwintMgr, dm, 'skellige_storm', 3 );

	// Нейтральные спецкарты для колоды Скеллиге (9 карт)
	ModCheats_EnsureCard( gwintMgr, dm, 'dummy', 3 );
	ModCheats_EnsureCard( gwintMgr, dm, 'horn', 3 );
	ModCheats_EnsureCard( gwintMgr, dm, 'scorch', 3 );

	FactsAdd( "Gwint_Card_Looted" );

	theGame.GetGuiManager().ShowNotification( "ПОЛНАЯ колода Скеллиге выдана! Всего: 55 карт" );
	theGame.witcherLog.AddCombatMessage( "Колода Скеллиге: получены ВСЕ карты и лидеры фракции (55 карт, включая полные комплекты по 3 копии и спецкарты)", NULL, thePlayer );
}

function ModCheats_GiveAllMonstersCards()
{
	var gwintMgr : CR4GwintManager;
	var dm : CDefinitionsManagerAccessor;
	var monPlayerDeck : SDeckDefinition;

	gwintMgr = theGame.GetGwintManager();
	if ( !gwintMgr )
	{
		return;
	}

	dm = theGame.GetDefinitionsManager();

	if ( !gwintMgr.GetFactionDeck( GwintFaction_NoMansLand, monPlayerDeck ) || monPlayerDeck.leaderCard == '' )
	{
		monPlayerDeck.leaderCard = 'eredin_copper';
		monPlayerDeck.specialCard = '';
		monPlayerDeck.unlocked = true;
		gwintMgr.SetFactionDeck( GwintFaction_NoMansLand, monPlayerDeck );
	}
	gwintMgr.UnlockDeck( GwintFaction_NoMansLand );

	// Лидеры (5 версий Эредина)
	ModCheats_EnsureLeader( gwintMgr, dm, 'eredin_copper' );
	ModCheats_EnsureLeader( gwintMgr, dm, 'eredin_bronze' );
	ModCheats_EnsureLeader( gwintMgr, dm, 'eredin_silver' );
	ModCheats_EnsureLeader( gwintMgr, dm, 'eredin_gold' );
	ModCheats_EnsureLeader( gwintMgr, dm, 'eredin_platinium' );

	// Герои Чудовищ (4 карты)
	ModCheats_EnsureCard( gwintMgr, dm, 'draug', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'kayran', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'imlerith', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'leshen', 1 );

	// Группы призыва: Главоглазы (4), Наккеры (3), Гули (3), Ведьмицы (3) (13 карт)
	ModCheats_EnsureCard( gwintMgr, dm, 'arachas', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'arachas2', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'arachas3', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'arachas_behemoth', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'nekker', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'nekker2', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'nekker3', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'ghoul', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'ghoul2', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'ghoul3', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'crone_brewess', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'crone_weavess', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'crone_whispess', 1 );

	// Вампиры (5 карт)
	ModCheats_EnsureCard( gwintMgr, dm, 'bruxa', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'ekkima', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'fleder', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'garkain', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'katakan', 1 );

	// Остальные уникальные Чудовища (19 карт)
	ModCheats_EnsureCard( gwintMgr, dm, 'toad', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'fiend', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'earth_elemental', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'fire_elemental', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'werewolf', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'forktail', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'plague_maiden', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'griffin', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'ice_giant', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'botchling', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'frightener', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'grave_hag', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'endrega', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'harpy', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'celaeno_harpy', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'cockatrice', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'gargoyle', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'fogling', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'wyvern', 1 );

	// Погода и спецкарты для колоды Чудовищ (19 карт)
	ModCheats_EnsureCard( gwintMgr, dm, 'frost', 3 );
	ModCheats_EnsureCard( gwintMgr, dm, 'fog', 3 );
	ModCheats_EnsureCard( gwintMgr, dm, 'rain', 2 );
	ModCheats_EnsureCard( gwintMgr, dm, 'clear_sky', 2 );
	ModCheats_EnsureCard( gwintMgr, dm, 'scorch', 3 );
	ModCheats_EnsureCard( gwintMgr, dm, 'horn', 3 );
	ModCheats_EnsureCard( gwintMgr, dm, 'dummy', 3 );

	FactsAdd( "Gwint_Card_Looted" );

	theGame.GetGuiManager().ShowNotification( "ПОЛНАЯ колода Чудовищ выдана! Всего: 65 карт" );
	theGame.witcherLog.AddCombatMessage( "Колода Чудовищ: получены ВСЕ карты и лидеры фракции (65 карт, включая все группы призыва, вампиров и погоду)", NULL, thePlayer );
}

exec function giveskellige()
{
	ModCheats_GiveAllSkelligeCards();
}

exec function givemonsters()
{
	ModCheats_GiveAllMonstersCards();
}

function ModCheats_GiveAllNorthernCards()
{
	var gwintMgr : CR4GwintManager;
	var dm : CDefinitionsManagerAccessor;
	var nrPlayerDeck : SDeckDefinition;

	gwintMgr = theGame.GetGwintManager();
	if ( !gwintMgr )
	{
		return;
	}

	dm = theGame.GetDefinitionsManager();

	if ( !gwintMgr.GetFactionDeck( GwintFaction_NothernKingdom, nrPlayerDeck ) || nrPlayerDeck.leaderCard == '' )
	{
		nrPlayerDeck.leaderCard = 'foltest_copper';
		nrPlayerDeck.specialCard = '';
		nrPlayerDeck.unlocked = true;
		gwintMgr.SetFactionDeck( GwintFaction_NothernKingdom, nrPlayerDeck );
	}
	gwintMgr.UnlockDeck( GwintFaction_NothernKingdom );

	// Лидеры (5 карт Фольтеста)
	ModCheats_EnsureLeader( gwintMgr, dm, 'foltest_copper' );
	ModCheats_EnsureLeader( gwintMgr, dm, 'foltest_bronze' );
	ModCheats_EnsureLeader( gwintMgr, dm, 'foltest_silver' );
	ModCheats_EnsureLeader( gwintMgr, dm, 'foltest_gold' );
	ModCheats_EnsureLeader( gwintMgr, dm, 'foltest_platinium' );

	// Герои Королевств Севера (4 карты)
	ModCheats_EnsureCard( gwintMgr, dm, 'vernon', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'natalis', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'esterad', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'philippa', 1 );

	// Легендарные шпионы Севера (3 карты)
	ModCheats_EnsureCard( gwintMgr, dm, 'thaler', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'dijkstra', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'stennis', 1 );

	// Уникальные персонажи, маги и специалисты (8 карт)
	ModCheats_EnsureCard( gwintMgr, dm, 'ves', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'siegfried', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'yarpen', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'keira', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'sile', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'sabrina', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'sheldon', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'dethmold', 1 );

	// Осадные орудия, башни и поддержка (11 карт)
	ModCheats_EnsureCard( gwintMgr, dm, 'catapult', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'catapult2', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'trebuchet', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'trebuchet2', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'ballista', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'ballista2', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'siege_tower', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'dun_banner_medic', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'kaedweni_siege', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'kaedweni_siege2', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'kaedweni_siege3', 1 );

	// Пехотные отряды и связки прочной связи (11 карт)
	ModCheats_EnsureCard( gwintMgr, dm, 'blue_stripes', 3 );
	ModCheats_EnsureCard( gwintMgr, dm, 'crinfrid', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'crinfrid2', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'crinfrid3', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'poor_infantry', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'poor_infantry2', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'poor_infantry3', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'redanian', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'redanian2', 1 );

	// Нейтральные герои, медики и шпионы (9 карт)
	ModCheats_EnsureCard( gwintMgr, dm, 'mysterious_elf', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'villen', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'dandelion', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'yennefer', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'geralt', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'ciri', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'triss', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'olgierd', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'cow', 1 );

	// Спецкарты и погодные эффекты для Севера (16 карт)
	ModCheats_EnsureCard( gwintMgr, dm, 'dummy', 3 );
	ModCheats_EnsureCard( gwintMgr, dm, 'horn', 3 );
	ModCheats_EnsureCard( gwintMgr, dm, 'scorch', 3 );
	ModCheats_EnsureCard( gwintMgr, dm, 'clear_sky', 3 );
	ModCheats_EnsureCard( gwintMgr, dm, 'frost', 2 );
	ModCheats_EnsureCard( gwintMgr, dm, 'fog', 1 );
	ModCheats_EnsureCard( gwintMgr, dm, 'rain', 1 );

	FactsAdd( "Gwint_Card_Looted" );

	theGame.GetGuiManager().ShowNotification( "ПОЛНАЯ колода Королевств Севера выдана! Всего: 67 карт" );
	theGame.witcherLog.AddCombatMessage( "Колода Севера: получены ВСЕ карты и лидеры фракции (67 карт, включая шпионов, медиков, связки и лидеров Фольтеста)", NULL, thePlayer );
}

exec function givenorthern()
{
	ModCheats_GiveAllNorthernCards();
}

exec function givenorth()
{
	ModCheats_GiveAllNorthernCards();
}


