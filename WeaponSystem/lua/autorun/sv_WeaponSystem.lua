include("lua/entities/SpawnedEnt/init.lua")
hook.Add( "PlayerButtonDown", "PlayerButtonDownLoad", function( ply, button )
    local trace = ply:GetEyeTrace()
    local hitpos = trace.HitPos
    if button == 15 then
        if (ply:GetPos():Distance(hitpos)) >= 60 and (ply:GetPos():Distance(hitpos) <= 120) then
            if (ply:GetActiveWeapon():GetClass()) != NULL then
                local ent = ents.Create("SpawnedEnt")
                ent:SetPos(hitpos)
                ent:SetAngles(Angle(90,90,270))
                ent:Spawn()
                ent:Activate()
                ply:StripWeapon(ply:GetActiveWeapon():GetClass())
            end
        end
    end
end)