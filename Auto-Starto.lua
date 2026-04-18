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
    -- 2. DATABASE UTAMA & EVENT DADAKAN
    -- ==========================================
    -- Menggunakan Micro-Keywords agar kebal Typo & Linebreaks dari server GT
    local external_events = {
        ["grumpy ambassador"] = Dip,
        ["it's your mother"] = Dip,
        ["pirate are hacking"] = AI,
        ["pirates are hacking"] = AI,
        ["popups when they hail"] = AI,
        ["leaking radiation"] = Meds,
        ["misfiled documents"] = Doc,
        ["bureaucrat from"] = Doc,
        ["wing of pirate ships"] = Torp,
        ["rogue fighter"] = Torp,
        ["grinding sound"] = Torp,
        ["test fire of the torpedoes"] = Torp,
        ["silicoid worms"] = Shield,
        ["still fluctuating"] = Shield,
        ["space debris"] = Shield,
        ["rabid space dogs"] = Giga,
        ["disloyal crew"] = Giga,
        ["space snakes"] = Giga,
        ["cargo door isn't opening"] = Gala,
        ["almost hanging off"] = Gala,
        ["lights throughout the ship"] = Gala,
        ["plumbing isn't working"] = Gala,
        ["losing pressure to that oxygen"] = Gala,
        ["starvation crisis"] = Sup
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
        ["Doing The Job"] = {Drone, Dip, Teleporter, Sup, Doc, Teleporter},
        ["Doing The Right Thing"] = {Drone, Shield, Teleporter, Giga, Scan, Teleporter},
        ["Doctor In The House"] = {Drone, Teleporter, Dip, Meds, Giga, Dip},
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
        ["Solar Impact"] = {Shield, Gala, Meds, AI, Drone, Gala, Meds, Gala},
        ["Space Detective"] = {Drone, Teleporter, Doc, Torp},
        ["Space Opera"] = {Drone, Teleporter, Dip, Dip, Giga, Doc},
        ["Starachnid Attack"] = {Drone, Torp, Sup, Torp, Giga},
        ["Stuck In The Middle"] = {Drone, Shield, AI, Dip, AI},
        ["Taking Aim"] = {Drone, Teleporter, Giga, Teleporter},
        ["Tasty Cakes"] = {Drone, Teleporter, Scan, AI, Scan, Giga, Teleporter},
        ["Weird Contraption"] = {Drone, Teleporter, Scan, Teleporter, Doc},
        ["Who's There"] = {Drone, Teleporter, Scan, AI, Scan, Giga},
        ["Windy Days"] = {Drone, Teleporter, Scan, Teleporter}
    }

    local successes = 0
    local current_mission = ""
    local handling_event = false
    local neutral_count = 0 
    local just_healed = false 
    local queued_heals = {} -- Sistem antrean Heal

    local function getMissionSequenceAndName(title)
        if title == "" then return nil, nil end
        if exact_missions[title] then return exact_missions[title], title end
        
        -- Fallback Regex kalau misi benar-benar baru
        if title:find("Data") then return {Drone, Teleporter, Scan, Teleporter, Doc}, title end
        if title:find("Attack") then return {Drone, Shield, Torp, Torp}, title end
        if title:find("Hunt") then return {Drone, Teleporter, Scan, Giga, Teleporter}, title end
        if title:find("Cleanup") then return {Drone, Shield, Torp, Shield, Doc}, title end
        if title:find("Duel") then return {Drone, Shield, Torp, AI, Torp}, title end
        if title:find("Delivery") then return {Drone, Teleporter, Scan, Giga, Sup}, title end
        if title:find("Extermination") then return {Drone, Teleporter, Scan, Giga, Sup}, title end
        if title:find("Rescue") then return {Drone, Teleporter, Dip, Meds, Doc}, title end
        return nil, nil
    end

    -- ==========================================
    -- 3. HOOK UTAMA
    -- ==========================================
    function Hook(var)
        if var.v1:find("OnDialogRequest") then
            
            if var.v2:find("end_dialog|startopia") and var.v2:find("Health") then
                
                local clean_dialog = var.v2:gsub("`.", "")
                local lower_dialog = clean_dialog:lower()
                
                -- TRUE TITLE CLEANER (Membunuh semua simbol dan warna)
                local raw_title = var.v2:match("add_label_with_icon|big|`w([^|\n]+)")
                local clean_title = ""
                if raw_title then
                    clean_title = raw_title:gsub("`.", ""):gsub("[?!]", ""):match("^%s*(.-)%s*$")
                end

                -- DETEKSI STATUS HEALTH & REPUTATION
                local ship_hp = tonumber(lower_dialog:match("ship.-(%d+)%%")) or 100
                local crew_hp = tonumber(lower_dialog:match("crew.-(%d+)%%")) or 100
                local rep_hp  = tonumber(lower_dialog:match("rep.-(%d+)%%")) or 100

                local event_finished_now = handling_event
                handling_event = false

                -- AMBIL SEQUENCE BERDASARKAN CLEAN TITLE
                local seq, m_name = getMissionSequenceAndName(clean_title)
                local is_late_stage = false
                local remaining_steps = 99
                
                if seq then
                    remaining_steps = #seq - successes
                    is_late_stage = (remaining_steps <= 3)
                end
                local is_healthy = (ship_hp >= 80 and crew_hp >= 80 and rep_hp >= 80)

                -- QUEUE HEALER (Diisi sesaat setelah obstacle berhasil dibersihkan)
                if event_finished_now then
                    LogToConsole("`b[`5EVENT`b] `2Obstacle Selesai!")
                    
                    if ship_hp < 50 then
                        LogToConsole("`b[`2QUEUE`b] `4Ship kritis ("..ship_hp.."%)! `2Antri 2x Galactibolt.")
                        table.insert(queued_heals, Gala); table.insert(queued_heals, Gala)
                    elseif ship_hp <= 60 then
                        LogToConsole("`b[`2QUEUE`b] `4Ship rendah ("..ship_hp.."%)! `2Antri 1x Galactibolt.")
                        table.insert(queued_heals, Gala)
                    end

                    if crew_hp < 50 then
                        LogToConsole("`b[`2QUEUE`b] `4Crew kritis ("..crew_hp.."%)! `2Antri 2x Space Meds.")
                        table.insert(queued_heals, Meds); table.insert(queued_heals, Meds)
                    elseif crew_hp <= 60 then
                        LogToConsole("`b[`2QUEUE`b] `4Crew rendah ("..crew_hp.."%)! `2Antri 1x Space Meds.")
                        table.insert(queued_heals, Meds)
                    end

                    if rep_hp < 50 then
                        LogToConsole("`b[`2QUEUE`b] `4Reputation kritis ("..rep_hp.."%)! `2Antri 2x Star Supplies.")
                        table.insert(queued_heals, Sup); table.insert(queued_heals, Sup)
                    elseif rep_hp <= 60 then
                        LogToConsole("`b[`2QUEUE`b] `4Reputation rendah ("..rep_hp.."%)! `2Antri 1x Star Supplies.")
                        table.insert(queued_heals, Sup)
                    end
                end

                -- EKSEKUSI ANTREAN HEAL DULUAN (Jika ada)
                if #queued_heals > 0 then
                    local tool_to_use = table.remove(queued_heals, 1)
                    just_healed = true
                    tool_to_use()
                    return true -- Bypass sisa logic, fokus nge-heal!
                end

                -- PENYADAP EVENT DADAKAN (OBSTACLE)
                for keyword, tool_func in pairs(external_events) do
                    if lower_dialog:find(keyword, 1, true) then
                        if is_late_stage and is_healthy then
                            LogToConsole("`b[`5SKIP`b] `dObstacle diabaikan! Sisa " .. remaining_steps .. " langkah, HP aman ditabrak.")
                            break 
                        else
                            LogToConsole("`b[`5EVENT`b] `dMenyelesaikan Obstacle: " .. keyword)
                            handling_event = true
                            tool_func()
                            return true 
                        end
                    end
                end

                -- ALUR MISI UTAMA
                if seq then
                    if var.v2:find("Skill Success") then
                        if not event_finished_now and not just_healed then
                            successes = successes + 1 
                        end
                        neutral_count = 0 
                        just_healed = false
                        current_mission = m_name 
                    elseif var.v2:find("Skill Fail") then
                        neutral_count = 0 
                        just_healed = false
                        current_mission = m_name
                    else
                        if current_mission == m_name then
                            if not just_healed and not event_finished_now then
                                neutral_count = neutral_count + 1
                                if neutral_count > 3 then
                                    LogToConsole("`b[`4PAUSE`b] `2Terlalu sering nyangkut! Item habis? Klik manual!")
                                    return false
                                end
                            end
                        else
                            if not just_healed and not event_finished_now then
                                successes = 0 
                                neutral_count = 0
                                current_mission = m_name
                                LogToConsole("`b[`9MISSION`b] `6" .. m_name .. " (Total: " .. #seq .. " Step)")
                            end
                        end
                        just_healed = false
                    end

                    local action_index = successes + 1 
                    if seq[action_index] then
                        seq[action_index]()
                        return true 
                    else
                        LogToConsole("`b[`4MANUAL`b] `2Urutan tool habis. Silakan klik manual.")
                        return false
                    end
                else
                    LogToConsole("`b[`4MANUAL`b] `2Misi tidak dikenali: " .. tostring(clean_title))
                    return false 
                end
            
            -- Gagal / Sukses Voyage
            elseif var.v2:find("It is a good day to flee!") then
                SendPacket(2, "action|dialog_return\ndialog_name|startopia\nbuttonClicked|failmission")
                LogToConsole("`b[`4FAIL`b]`2 Misi Gagal! Kapal mundur.")
                successes = 0
                current_mission = ""
                handling_event = false
                neutral_count = 0
                just_healed = false
                queued_heals = {}
                return true

            elseif var.v2:find("The voyage continues!") then
                SendPacket(2, "action|dialog_return\ndialog_name|startopia\nbuttonClicked|finishmission")
                LogToConsole("`b[`cSUCCESS`b] `2Misi Berhasil Diselesaikan!")
                successes = 0
                current_mission = ""
                handling_event = false
                neutral_count = 0
                just_healed = false
                queued_heals = {}
                return true
            end
        
        elseif var.v1:find("OnTalkBubble") and var.v3:find("You received") then
            return false
        end

        return false
    end

    -- ==========================================
    -- 4. STARTUP SCRIPT
    -- ==========================================
    local dialog = "add_label_with_icon|big|`2Auto Startopia V15|left|18|\nadd_spacer|small\nadd_textbox|`b~ `2Status: Title Catcher & Heal Queue Enabled!|left|\nadd_spacer|small\nadd_quick_exit|"
    local arr = {}
    arr.v0 = "OnDialogRequest"
    arr.v1 = dialog
    SendVariant(arr)
    Sleep(500)
    
    successes = 0
    current_mission = ""
    handling_event = false
    neutral_count = 0
    just_healed = false
    queued_heals = {}
    AddHook(Hook, "OnVariant")
end