#include <open.mp>

public OnGameModeInit()
{
    print("Anti heliblading started");
    return 1;
}

public OnPlayerTakeDamage(playerid, issuerid, Float:amount, WEAPON:weaponid, bodypart)
{
      if(weaponid == 50 && GetPlayerVehicleID(issuerid) != INVALID_VEHICLE_ID)
      {
          if(GetPlayerVehicleSeat(issuerid) == 0)
          {
              if(GetVehicleModel(GetPlayerVehicleID(issuerid)) == 497)
              {
                  new Float:vel[3], str[256];
                  GetVehicleVelocity(GetPlayerVehicleID(issuerid), vel[0], vel[1], vel[2]);
                  SetVehicleVelocity(GetPlayerVehicleID(issuerid), (vel[0] * -1)/2, (vel[1] * -1)/2, (vel[2] * -1)/2);
                  TogglePlayerControllable(issuerid, false);
                  SetTimerEx("Unfreeze", 350, false, "i", issuerid);
                  GameTextForPlayer(issuerid, "~r~Don't do Heli Blading!", 2000, 6);
                  TogglePlayerControllable(playerid, true);
              }
          }
  	}
    return 1;
}

public OnPlayerWeaponShot(playerid, WEAPON:weaponid, BULLET_HIT_TYPE:hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
    if(weaponid == 50)
	{
		new Float:vel[3], str[256];
        GetVehicleVelocity(GetPlayerVehicleID(issuerid), vel[0], vel[1], vel[2]);
        SetVehicleVelocity(GetPlayerVehicleID(issuerid), (vel[0] * -1)/2, (vel[1] * -1)/2, (vel[2] * -1)/2);
        TogglePlayerControllable(issuerid, false);
        SetTimerEx("Unfreeze", 350, false, "i", issuerid);
        GameTextForPlayer(issuerid, "~r~Don't do Heli Blading!", 2000, 6);
        TogglePlayerControllable(playerid, true);
		return 0;
	}
    return 1;
}

forward UnFreeze(playerid);
public UnFreeze(playerid)
{
  	TogglePlayerControllable(playerid, 1);
}
