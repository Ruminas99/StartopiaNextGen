if true then
    -- ==========================================
    -- 1. FUNGSI TOOLS
    -- ==========================================
    function Drone() SendPacket(2, "action|dialog_return\ndialog_name|startopia\nbuttonClicked|tool6532"); LogToConsole("`b[`2TOOLS`b] `4Tactical Drone") end
    function Teleporter() SendPacket(2, "action|dialog_return\ndialog_name|startopia\nbuttonClicked|tool6526"); LogToConsole("`b[`2TOOLS`b] `4Teleporter Charge") end
    function Doc() SendPacket(2, "action|dialog_return\ndialog_name|startopia\nbuttonClicked|tool6534"); LogToConsole("`b[`2TOOLS`b]`4 Stellar Documents") end
    function Scan() SendPacket(2, "action|dialog_return\ndialog_name|startopia\nbuttonClicked|tool6530"); LogToConsole("`b[`2TOOLS`b]`4 Quadriscanner") end
    function Torp() SendPacket(2, "action|dialog_return\ndialog_name|startopia\nbuttonClicked|tool6540"); LogToConsole("`b[`2TOOLS`b]`4 Growton Torpedo") end
    function Dip() SendPacket(2, "action|dialog_return\ndialog_name|startopia\nbuttonClicked|tool6538"); LogToConsole("`b[`2TOOLS`b]`4 Cyborg Diplomat") end
    function Sup() SendPacket(2, "action|dialog_return\ndialog_name|startopia\nbuttonClicked|tool6536"); LogToConsole("`b[`2TOOLS`b]`4 Star Supplies") end
    function Giga() SendPacket(2, "action|dialog_return\ndialog_name|startopia\nbuttonClicked|tool6528"); LogToConsole("`b[`2TOOLS`b] `4Gigablaster") end
    function Shield() SendPacket(2, "action|dialog_return\ndialog_name|startopia\nbuttonClicked|tool6518"); LogToConsole("`b[`2TOOLS`b] `4HyperShields") end
    function AI() SendPacket(2, "action|dialog_return\ndialog_name|startopia\nbuttonClicked|tool6520"); LogToConsole("`b[`2TOOLS`b] `4AI Brain") end
    function Gala() SendPacket(2, "action|dialog_return\ndialog_name|startopia\nbuttonClicked|tool6522"); LogToConsole("`b[`2TOOLS`b] `4Galactibolt") end
    function Meds() SendPacket(2, "action|dialog_return\ndialog_name|startopia\nbuttonClicked|tool6524"); LogToConsole("`b[`2TOOLS`b] `4Space Meds") end

    -- ==========================================
    -- 2. DATABASE 
    -- ==========================================
    local external_events = {
        ["Grumpy Ambassador"] = Dip,
        ["It's your mother!"] = Dip,
        ["Pirates are hacking"] = AI,
        ["Pirate are hacking"] = AI,
        ["Star Command are not happy"] = AI,
        ["reactor's leaking radiation"] = Meds,
        ["Misfiled documents"] = Doc,
        ["bureaucrat from Laymtak"] = Doc,
        ["wing of pirate ships"] = Torp,
        ["Grinding sound coming"] = Torp,
        ["test fire of the Torpedoes"] = Torp,
        ["rogue fighter"] = Torp,
        ["Silicoid Worms attached"] = Shield,
        ["Shield Generator still fluctuating"] = Shield,
        ["Space Debris"] = Shield,
        ["Rabid space dogs"] = Giga,
        ["Disloyal crew"] = Giga,
        ["Space snakes attack"] = Giga,
        ["The main cargo bay door isn't opening"] = Gala,
        ["cargo door isn't opening"] = Gala,
        ["engine is almost hanging off"] = Gala,
        ["lights throughout the ship are failing"] = Gala,
        ["plumbing isn't working"] = Gala,
        ["losing pressure to that oxygen leak"] = Gala,
        ["starvation crisis are blaming us"] = Sup
    }

    local exact_missions = {
        ["A Challenge"] = {Drone, Shield, Shield, Shield, Shield},
        ["A Strange One"] = {Drone, Dip, Gala, AI, Doc, Gala, Gala},
        ["A Tasty Bite"] = {Drone, Dip, Gala, Scan, AI, Gala, Torp},
        ["Ancient Temple"] = {Drone, Dip, Sup, Doc},
        ["Bad Taste"] = {Teleporter, Dip, Giga, Doc},
        ["Blackout"] = {Gala, Drone, Shield, Torp, Torp, Gala},
        ["Boarding Party"] = {Scan, Giga, Giga},
        ["Close Encounter"] = {Drone, AI, Dip, Dip, Scan, AI},
        ["Cryonite Crisis"] = {Teleporter, Scan, Giga, Scan, AI, AI, Shield, Gala, Doc, Teleporter},
        ["Dark Ship"] = {Drone, Teleporter, AI, Torp, Torp},
        ["Daydreamer"] = {Drone, Teleporter, Dip, Giga},
        ["Doing The Job!"] = {Drone, Dip, Teleporter, Sup, Doc, Teleporter},
        ["Doing The Right Thing!"] = {Drone, Shield, Teleporter, Giga, Scan, Teleporter},
        ["Doctor In The House!"] = {Drone, Teleporter, Dip, Meds, Giga, Dip},
        ["Escape Pod"] = {Meds, Drone, Shield, Teleporter, Scan, Giga, Meds, Scan, Teleporter, Torp},
        ["Experimental Salvage"] = {Drone, Teleporter, Teleporter, Teleporter, Teleporter},
        ["Ghost Ship"] = {Drone, Teleporter, Scan, Dip, Doc, Teleporter},
        ["Giant Skeleton"] = {Drone, AI, Shield, Sup},
        ["Gross Mistake"] = {Drone, Teleporter, Scan, Giga, Sup, Teleporter},
        ["Hunter and Prey"] = {Drone, AI, Teleporter, Giga, Teleporter},
        ["Junk Punks"] = {AI, Drone, Torp, AI},
        ["Life Pod"] = {Teleporter, Scan, Meds, Sup},
        ["Lonely Little Droid"] = {Dip, Teleporter, Sup, Scan, Giga},
        ["Mining Colony Delivery"] = {Drone, Teleporter, Scan, Sup, Giga, Doc},
        ["Mining Colony Rescue"] = {Drone, Teleporter, Dip, Meds, Doc},
        ["Miner Rescue"] = {Gala, Drone, Teleporter, Scan, Teleporter, Teleporter},
        ["One Angry Ship"] = {Drone, Torp, Dip, Teleporter, Doc, Teleporter},
        ["Outpost Attack"] = {Drone, Torp, Dip, Teleporter, Doc, Teleporter},
        ["Pit o' Trouble"] = {Drone, Teleporter, Scan, Giga, Teleporter, Torp},
        ["Planet Calamity"] = {Drone, Teleporter, AI, Teleporter, Shield, Torp, Teleporter},
        ["Planet Of Echoes"] = {Drone, Dip, Teleporter, Scan, Giga, Teleporter},
        ["Prevent War"] = {Shield, Drone, Dip, Teleporter, Doc, Gala, Sup},
        ["Putting Down Roots"] = {Drone, Teleporter, Scan, Dip, Doc, Sup},
        ["Salvage Run"] = {Drone, Teleporter, Scan, Teleporter},
        ["Secret Stash"] = {Drone, Shield, Teleporter, Giga, Scan, Teleporter},
        ["Set a Course"] = {Drone, Doc},
        ["Shadow Stalkers"] = {Drone, Teleporter, Scan, AI, Giga, Teleporter, Scan, Teleporter, Torp},
        ["She's Gonna Blow"] = {Drone, Teleporter, Scan, AI, Scan, Giga},
        ["Space Ship Rescue"] = {Gala, Drone, Teleporter, Scan, Meds, Teleporter},
        ["Skeleton Crew"] = {Teleporter, Scan, AI, Doc},
        ["Solar Impact!"] = {Shield, Gala, Meds, AI, Drone, Gala, Meds, Gala},
        ["Space Detective"] = {Drone, Teleporter, Doc, Torp},
        ["Space Opera"] = {Drone, Teleporter, Dip, Dip, Giga, Doc},
        ["Starachnid Attack"] = {Drone, Torp, Sup, Torp, Giga},
        ["Stuck In The Middle"] = {Drone, Shield, AI, Dip, AI},
        ["Taking Aim"] = {Drone, Teleporter, Giga, Teleporter},
        ["Tasty Cakes"] = {Drone, Teleporter, Scan, AI, Scan, Giga, Teleporter},
        ["Weird Contraption"] = {Drone, Teleporter, Scan, Teleporter, Doc},
        ["Who's there?"] = {Drone, Teleporter, Scan, AI, Scan, Giga},
        ["Who's There"] = {Drone, Teleporter, Scan, AI, Scan, Giga},
        ["Windy Days"] = {Drone, Teleporter, Scan, Teleporter}
    }

    -- ==========================================
    -- 3. MESIN NORMALISASI & ISOLASI
    -- ==========================================
    local function cleanString(str)
        if not str then return "" end
        local s = str:gsub("`.", "") 
        s = s:gsub("[%p%c%s]", "") 
        return s:lower()
    end

    local db_missions = {}
    for k, v in pairs(exact_missions) do
        db_missions[cleanString(k)] = {original_name = k, seq = v}
    end

    local db_events = {}
    for k, v in pairs(external_events) do
        db_events[cleanString(k)] = {original_name = k, tool = v}
    end

    local function getMissionSequenceAndName(raw_title)
        if not raw_title or raw_title == "" then return nil, nil end
        local norm_title = cleanString(raw_title)
        
        if db_missions[norm_title] then 
            return db_missions[norm_title].seq, db_missions[norm_title].original_name 
        end
        
        if norm_title:find("data") then return {Drone, Teleporter, Scan, Teleporter, Doc}, raw_title end
        if norm_title:find("attack") then return {Drone, Shield, Torp, Torp}, raw_title end
        if norm_title:find("hunt") then return {Drone, Teleporter, Scan, Giga, Teleporter}, raw_title end
        if norm_title:find("cleanup") then return {Drone, Shield, Torp, Shield, Doc}, raw_title end
        if norm_title:find("duel") then return {Drone, Shield, Torp, AI, Torp}, raw_title end
        if norm_title:find("delivery") then return {Drone, Teleporter, Scan, Giga, Sup, Teleporter}, raw_title end
        if norm_title:find("extermination") then return {Drone, Teleporter, Scan, Sup, Giga, Doc}, raw_title end
        if norm_title:find("rescue") then return {Drone, Teleporter, Dip, Meds, Doc}, raw_title end
        return nil, nil
    end

    -- ==========================================
    -- 4. STATE TRACKER
    -- ==========================================
    local action_state = "IDLE" 
    local successes = 0
    local neutral_count = 0
    local event_retry_count = 0 
    local current_mission = ""
    local queued_heals = {}

    -- ==========================================
    -- 5. HOOK UTAMA
    -- ==========================================
    function Hook(var)
        if var.v1:find("OnDialogRequest") then
            
            if var.v2:find("end_dialog|startopia") and var.v2:find("Health") then
                
                -- ISOLASI JUDUL
                local raw_title = var.v2:match("add_label_with_icon|big|`w([^|\n]+)")
                local clean_title = ""
                local body_text = var.v2
                
                if raw_title then
                    clean_title = raw_title:gsub("`.", ""):gsub("[?!]", ""):match("^%s*(.-)%s*$")
                    local safe_title = raw_title:gsub("([%^%$%(%)%%%.%[%]%*%+%-%?])", "%%%1")
                    body_text = var.v2:gsub(safe_title, "")
                end

                local body_norm = cleanString(body_text)

                -- PROSES SKILL SUCCESS / FAIL
                local is_success = var.v2:find("Skill Success")
                local is_fail = var.v2:find("Skill Fail")

                -- [DEBUG LOG] Melihat persis apa yang dipikirkan Bot
                LogToConsole("`b[`eDEBUG`b] `oMembaca Judul: " .. tostring(clean_title))
                LogToConsole("`b[`eDEBUG`b] `oState Sebelumnya: " .. action_state .. " | Successes: " .. successes)

                if is_success then
                    if action_state == "MISSION" then
                        successes = successes + 1
                        LogToConsole("`b[`eDEBUG`b] `2+1 Step Misi!")
                    else
                        LogToConsole("`b[`eDEBUG`b] `6Success bukan dari Misi, Step tetap!")
                    end
                    action_state = "IDLE"
                    neutral_count = 0
                    event_retry_count = 0
                elseif is_fail then
                    action_state = "IDLE"
                    neutral_count = 0
                    event_retry_count = 0
                else
                    if action_state == "MISSION" then
                        neutral_count = neutral_count + 1
                    end
                end

                -- DETEKSI EXTERNAL MISSION
                for k_norm, event_data in pairs(db_events) do
                    if body_norm:find(k_norm, 1, true) then
                        if action_state == "OBSTACLE" then
                            event_retry_count = event_retry_count + 1
                            if event_retry_count > 3 then
                                LogToConsole("`b[`4PAUSE`b] `2Item untuk Event Habis! Silakan klik manual.")
                                return false
                            end
                        else
                            event_retry_count = 0
                        end

                        LogToConsole("`b[`5EVENT`b] `dObstacle: " .. event_data.original_name)
                        action_state = "OBSTACLE"
                        event_data.tool()
                        return false -- [DEBUG] Biarkan UI Terbuka
                    end
                end

                -- BACA HP & QUEUE HEALING
                local ship_hp = tonumber(var.v2:lower():match("ship.-(%d+)%%")) or 100
                local crew_hp = tonumber(var.v2:lower():match("crew.-(%d+)%%")) or 100
                local rep_hp  = tonumber(var.v2:lower():match("rep.-(%d+)%%")) or 100

                if #queued_heals == 0 and action_state == "IDLE" then
                    if ship_hp < 50 then table.insert(queued_heals, Gala); table.insert(queued_heals, Gala)
                    elseif ship_hp <= 60 then table.insert(queued_heals, Gala) end
                    
                    if crew_hp < 50 then table.insert(queued_heals, Meds); table.insert(queued_heals, Meds)
                    elseif crew_hp <= 60 then table.insert(queued_heals, Meds) end
                    
                    if rep_hp < 50 then table.insert(queued_heals, Sup); table.insert(queued_heals, Sup)
                    elseif rep_hp <= 60 then table.insert(queued_heals, Sup) end
                    
                    if #queued_heals > 0 then
                        LogToConsole("`b[`2QUEUE`b] `4HP Rendah! Mengantre " .. #queued_heals .. "x Heal.")
                    end
                end

                if #queued_heals > 0 then
                    local tool_to_use = table.remove(queued_heals, 1)
                    action_state = "HEAL"
                    tool_to_use()
                    return false -- [DEBUG] Biarkan UI Terbuka
                end

                -- ALUR MISI UTAMA
                local seq, m_name = getMissionSequenceAndName(raw_title)
                if seq then
                    if current_mission ~= m_name then
                        current_mission = m_name
                        successes = 0
                        neutral_count = 0
                        event_retry_count = 0
                        queued_heals = {}
                        action_state = "IDLE"
                        LogToConsole("`b[`9MISSION`b] `6" .. m_name .. " (Total: " .. #seq .. " Step)")
                    end

                    if neutral_count > 3 then
                        LogToConsole("`b[`4PAUSE`b] `2Macet/Item Habis? Silakan klik manual 1 kali!")
                        return false
                    end

                    local action_index = successes + 1 
                    if seq[action_index] then
                        action_state = "MISSION"
                        seq[action_index]()
                        return false -- [DEBUG] Biarkan UI Terbuka
                    else
                        LogToConsole("`b[`4MANUAL`b] `2Urutan tool habis. Silakan klik manual.")
                        return false
                    end
                else
                    LogToConsole("`b[`4ERROR`b] `2Misi tidak dikenali: " .. tostring(raw_title))
                    return false 
                end
            
            -- Gagal / Sukses Voyage
            elseif var.v2:find("It is a good day to flee!") then
                SendPacket(2, "action|dialog_return\ndialog_name|startopia\nbuttonClicked|failmission")
                LogToConsole("`b[`4FAIL`b]`2 Misi Gagal! Kapal mundur.")
                successes = 0
                current_mission = ""
                action_state = "IDLE"
                queued_heals = {}
                neutral_count = 0
                event_retry_count = 0
                return false -- [DEBUG] Biarkan UI Terbuka

            elseif var.v2:find("The voyage continues!") then
                SendPacket(2, "action|dialog_return\ndialog_name|startopia\nbuttonClicked|finishmission")
                LogToConsole("`b[`cSUCCESS`b] `2Misi Berhasil Diselesaikan!")
                successes = 0
                current_mission = ""
                action_state = "IDLE"
                queued_heals = {}
                neutral_count = 0
                event_retry_count = 0
                return false -- [DEBUG] Biarkan UI Terbuka
            end
        
        elseif var.v1:find("OnTalkBubble") and var.v3:find("You received") then
            return false
        end

        return false
    end

    -- ==========================================
    -- 6. STARTUP SCRIPT
    -- ==========================================
    local dialog = "add_label_with_icon|big|`2Auto Startopia V18|left|18|\nadd_spacer|small\nadd_textbox|`b~ `2Status: UI VISIBLE & DEBUG MODE|left|\nadd_spacer|small\nadd_quick_exit|"
    local arr = {}
    arr.v0 = "OnDialogRequest"
    arr.v1 = dialog
    SendVariant(arr)
    Sleep(500)
    
    successes = 0
    current_mission = ""
    action_state = "IDLE"
    queued_heals = {}
    neutral_count = 0
    event_retry_count = 0
    AddHook(Hook, "OnVariant")
end