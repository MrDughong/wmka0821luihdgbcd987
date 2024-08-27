if nomorBot == 1 then
	worldDrop = "SJXO8AUWBDBD"
	worldBreak = "S3DVKQBQ"
	idBreak = "MORI11"
	farmworlds = {"8734hfb3dn02","nuef87hddu03","eyuf873bhe04","uif832idjn05","brfrijfbhw06","befjibhedi07","ajfnuiahna08","bhg98su8ew09","bh98uefndd10"}
	link = "https://discordapp.com/api/webhooks/1277214389816262668/buGEFSyg7b4k3HNLxdZw5OBOa3inx43Y8MNnDUOYznzNek5car4kdlU8W2GumtG4-IM4"
elseif nomorBot == 2 then
	worldDrop = "SJXO8AU7BDBD"
	worldBreak = "W3UWQGA7"
	idBreak = "MORI11"
	farmworlds = {"hfuihwefbh01","jvuhy3hcdu02","sv73egajdk03","bhfijwjrfa04","sfnuijfiwe05","eig89ehsjn06","esyf87ehfx07","duerw78sej08","efh874rhdj09","weury278bf10"}
	link = "https://discordapp.com/api/webhooks/1277214607617949707/Smy_OaP4KkbdTPHUc6nFSrGTYq5PFC2OVYxNp7QesH9uQ7UxVwu9r2z7QdMV7bFFiUL2"
elseif nomorBot == 3 then
	worldDrop = "SJXO8AU7BDHD"
	worldBreak = "MR79JCYF"
	idBreak = "MORI11"
	farmworlds = {"8t7fnjsfur01","eufhs87cer02","nieyr7w8hd03","uceyrfwcbu04","bhvijeuhij05","3t7sfzhcer06","woqe0i9ifs07","d735tye4r708","uwyrtwwdba09","bh89ehbd8h10"}
	link = "https://discordapp.com/api/webhooks/1277214713847218246/1sKrRacd9rhZT_Nz9Tsbi1zKrPa8a2ftFyAXr5ERx3-JxnMPoGUjoXc3UKL4zLSW8Yit"
elseif nomorBot == 4 then
	worldDrop = "SFXO8AU7BDHD"
	worldBreak = "77Z883AB"
	idBreak = "MORI11"
	farmworlds = {"74y53hfjnv01","weruw87ras02","uiery37bhd03","wiurg87kms04","q9u2398jss05","aidg3ejajn06","utey74etfs07","7tuehfnjef08","aiwhhw8rhn09","nifuhbhwif10"}
	link = "https://discordapp.com/api/webhooks/1277214789025927168/AJ4vUV9F9qPLUqOUPkJ04MjCZeyrSvdYrKZ3Q2tS0r5WEVr3wJXVL7ZVVFOBr6UWMj9W"
end

local wb = Webhook.new(link)
world = string.upper(farmworlds[startWorld])
function deletehistory()
	for _, list in pairs(wlist) do
		bot:sendPacket(3, "action|join_request\nname|".. string.upper((list)).."\ninvitedWorld|0")
		sleep(5000)
		while getWorld().name == "EXIT" do
			::bckWarpSwipe::
			bot:sendPacket(3, "action|join_request\nname|".. string.upper((list)).."\ninvitedWorld|0")
			sleep(3000)
			while bot.status ~= 1 do
				sleep(3000)
				if bot.status == 1 then
					break
				end
			end
			if getWorld().name == string.upper((list)) then
				break
			else
				goto bckWarpSwipe
			end
			sleep(10000)
		end
	end
end

function nextworld()
	for i = 1,#farmworlds do
		if (world == string.upper(farmworlds[i])) then
			::bckWN::
			bot:sendPacket(3, "action|join_request\nname|".. (farmworlds[i+1]).."\ninvitedWorld|0")
			sleep(1000)
			world = string.upper(farmworlds[i+1])
			while getWorld().name ~= world do
				sleep(5000)
				bot:warp(world)
				sleep(3000)
				while bot.status ~= 1 do
					sleep(5000)
					if bot.status == 1 then
						sleep(4000)
						break
					end
				end
				if getWorld().name == world then
					break
				end
			end
			if getWorld().name ~= world or bot:getWorld():getTile(math.floor(getLocal().posx // 32), math.floor(getLocal().posy // 32)).fg == 6 then
				wb.content = getBot().name.." Starting Rotation at "..world
				wb:send()
				ckbot = true
			else
				goto bckWN
			end
			break
		end
	end
end

function checkblock()
	for _, tile in pairs(getTiles()) do
		if tile.fg == ItemID then
			bot:findPath(tile.x, tile.y)
			sleep(200)
			while bot:getWorld():getTile(math.floor(getLocal().posx // 32), math.floor(getLocal().posy // 32)).fg ~= 0 do
				bot:hit(math.floor(getLocal().posx // 32), math.floor(getLocal().posy // 32))
				sleep(180)
			end
		end
	end
end

function joinWorld()
	while getWorld().name ~= world or bot:getWorld():getTile(math.floor(getLocal().posx // 32), math.floor(getLocal().posy // 32)).fg == 6 do
		::bckWarp::
		bot:warp(world.."|dahlahyas")
		sleep(3000)
		while bot.status ~= 1 do
			sleep(3000)
			if bot.status == 1 then
				sleep(4000)
				if getWorld().name == world then
					sleep(4000)
					if getWorld().name ~= world or bot:getWorld():getTile(math.floor(getLocal().posx // 32), math.floor(getLocal().posy // 32)).fg == 6 then
						goto bckWarp
					end
				else
					goto bckWarp
				end
				break
			end
		end
		sleep(5000)
		while getWorld().name ~= world do
			if bot.status == 1 then
				bot:warp(world.."|dahlahyas")
				sleep(5000)
				if getWorld().name == world then
					break
				end
			end
		end
	end
end

dc = 0
lstdrp = 0
function recon()
	while bot.status ~= 1 do
		sleep(5000)
		if dc == 0 then
			wb.content = bot.name.." Disconnected"
			wb:send()
		end
		dc = 1
		if bot.status == 1 then
			sleep(10000)
			wb.content = bot.name.." Reconnected"
			wb:send()
			dc = 0
			joinWorld()
			harvest()
			break
		end
	end
end

function buyanddrop()
	bot.auto_collect = false
	if bot:getInventory():findItem(ItemID + 1) >= 150 then
		bot:warp(worldDrop.."|dahlahyas")
		sleep(3000)
		while bot:getWorld().name ~= worldDrop do
			::bckDrps::
			bot:warp(worldDrop.."|dahlahyas")
			sleep(3000)
			while bot.status ~= 1 do
				sleep(3000)
				if bot.status == 1 then
					break
				end
			end
			if getWorld().name == worldDrop then
				sleep(4000)
				if getWorld().name ~= worldDrop or bot:getWorld():getTile(math.floor(getLocal().posx // 32), math.floor(getLocal().posy // 32)).fg == 6 then
					goto bckDrps
				end
				break
			end
			sleep(5000)
		end
		if bot:getInventory():findItem(ItemID + 1) >= 150 then
			::bckDropSeed::
			bot:drop(ItemID + 1, 130)
			sleep(1000)
			if bot:getInventory():findItem(ItemID + 1) >= 150 then
				bot:moveRight()
				sleep(300)
				goto bckDropSeed
			end
		end
	end
	if bot.gem_count >= 5000 then
		while bot.gem_count >= 1000 do
			if bot:getInventory():findItem(5706) == 200 then
				break
			end
			bot:sendPacket(2, "action|buy\nitem|ssp_10_pack")
			sleep(500)
		end
		if bot:getInventory():findItem(5706) == 200 then
			bot:warp(worldDrop.."|dahlahyas")
			sleep(3000)
			while getWorld().name ~= worldDrop do
				::bckDrpP::
				bot:warp(worldDrop.."|dahlahyas")
				sleep(3000)
				while bot.status ~= 1 do
					sleep(3000)
					if bot.status == 1 then
						break
					end
				end
				if getWorld().name == worldDrop then
					sleep(4000)
					if getWorld().name ~= worldDrop or bot:getWorld():getTile(math.floor(getLocal().posx // 32), math.floor(getLocal().posy // 32)).fg == 6 then
						goto bckDrpP
					end
					break
				end
				sleep(5000)
			end
			bot:moveUp()
			::backDropPack::
			sleep(500)
			bot:drop(5706, bot:getInventory():findItem(5706))
			sleep(1000)
			if bot:getInventory():findItem(5706) == 200 then
				bot:moveRight()
				sleep(300)
				goto backDropPack
			end
		end
	end
	if lstdrp == 1 then
		bot:warp(worldDrop.."|dahlahyas")
		sleep(3000)
		while bot:getWorld().name ~= worldDrop do
			::bckDrpL::
			bot:warp(worldDrop.."|dahlahyas")
			sleep(3000)
			while bot.status ~= 1 do
				sleep(3000)
				if bot.status == 1 then
					break
				end
			end
			if getWorld().name == worldDrop then
				sleep(4000)
				if getWorld().name ~= worldDrop or bot:getWorld():getTile(math.floor(getLocal().posx // 32), math.floor(getLocal().posy // 32)).fg == 6 then
					goto bckDrpL
				end
				break
			end
			sleep(5000)
		end
		if lstdrp == 1 and bot:getInventory():findItem(ItemID + 1) ~= nil then
			::backDropSit::
			bot:drop(ItemID + 1, bot:getInventory():findItem(ItemID + 1))
			sleep(300)
			if bot:getInventory():findItem(ItemID + 1) ~= 0 then
				bot:moveRight()
				sleep(300)
				goto backDropSit
			end
		end
		if lstdrp == 1 and bot:getInventory():findItem(5706) ~= nil then
			bot:moveUp()
			::backDropPek::
			sleep(500)
			bot:drop(5706, bot:getInventory():findItem(5706))
			sleep(300)
			if bot:getInventory():findItem(5706) ~= 0 then
				bot:moveRight()
				sleep(300)
				goto backDropPek
			end
		end
	end
end

function trashs()
	for i = 1, #trashlist do
		if bot:getInventory():findItem(trashlist[i]) ~= nil then
			bot:trash(trashlist[i], bot:getInventory():findItem(trashlist[i]))
			sleep(500)
		end
	end
end

function cekLastSeedPojok()
	if junaedi then
		if bot.status == 1 and getTile(97,52).fg == ItemID + 1 and getTile(97,52):canHarvest() == false then
			if getTile(97,50).fg == ItemID + 1 and getTile(97,50):canHarvest() == false then
				bot:say("Kelar BOS!!!")
				wb.content = getBot().name.." ("..world..")"
				wb:send()
				lstdrp = 1
				cekTanamLast = true
				buyanddrop()
				lstdrp = 0
				for i = 1,#farmworlds do
					if (world == string.upper(farmworlds[i])) then
						wb.content = "The next destination's "..getBot().name.." is "..string.upper(farmworlds[i + 1])
						wb:send()
					end
				end
				deletehistory()
				nextworld()
				junaedi = false
			end
		end
	end
	if junaedi then
		if bot.status == 1 and getTile(96,52).fg == ItemID + 1 and getTile(96,52):canHarvest() == false then
			if getTile(96,50).fg == ItemID + 1 and getTile(96,50):canHarvest() == false then
				bot:say("Kelar BOS!!!")
				wb.content = getBot().name.." ("..world..")"
				wb:send()
				lstdrp = 1
				cekTanamLast = true
				buyanddrop()
				lstdrp = 0
				for i = 1,#farmworlds do
					if (bot:getWorld().name == string.upper(farmworlds[i])) then
						wb.content = "The next destination's "..getBot().name.." is "..string.upper(farmworlds[i + 1])
						wb:send()
					end
				end
				deletehistory()
				nextworld()
				junaedi = false
			end
		end
	end
	junaedi = true
end

ckbot = true
junaedi = true
function harvest()
	bot:say("Harvesting")
	sleep(500)
	::bckHarvestRejo::
	joinWorld()
	checkblock()
	if ckbot then
		wb.content = getBot().name.." Starting Rotation..."
		wb:send()
		ckbot = false
	end
	for _, tile in pairs(getTiles()) do
		if bot.status == 1 and tile.fg == ItemID + 1 and tile:canHarvest() == true then
			bot.auto_collect = true
			if bot.status == 1 then
				if getWorld().name == world then
					recon()
					if bot.status == 1 and bot:getWorld():getTile(tile.x + 2, tile.y).fg == 202 or bot:getWorld():getTile(tile.x + 2, tile.y).fg ~= ItemID + 1 then
						bot:findPath(tile.x + 1, tile.y)
						sleep(200)
					else
						bot:findPath(tile.x + 2, tile.y)
						sleep(200)
					end
				else
					goto bckHarvestRejo
				end
			end
			for i, t in ipairs(angka) do
				if bot.status == 1 then
					if getWorld().name == world then
						recon()
						while bot.status == 1 and bot:getWorld():getTile(math.floor(getLocal().posx // 32) + t, math.floor(getLocal().posy // 32)).fg == ItemID + 1 do
							while bot.status ~= 1 do
								sleep(3000)
								if bot.status == 1 then
									sleep(4000)
									goto bckHarvestRejo
								end
							end
							bot:hit(math.floor(getLocal().posx // 32) + t, math.floor(getLocal().posy // 32))
							sleep(180)
						end
					else
						goto bckHarvestRejo
					end
				end
				if bot.status == 1 and PunchSoil == true then
					if getWorld().name == world then
						recon()
						while bot.status == 1 and bot:getWorld():getTile(math.floor(getLocal().posx // 32) + t, math.floor(getLocal().posy // 32) + 1).fg == 8644 do
							while bot.status ~= 1 do
								sleep(3000)
								if bot.status == 1 then
									sleep(4000)
									goto bckHarvestRejo
								end
							end
							bot:hit(math.floor(getLocal().posx // 32) + t, math.floor(getLocal().posy // 32) + 1)
							sleep(180)
						end
					else
						goto bckHarvestRejo
					end
				end
			end
			for i, t in ipairs(angka) do
				if bot.status == 1 then
					if getWorld().name == world then
						recon()
						while bot.status == 1 and bot:getWorld():getTile(math.floor(getLocal().posx // 32) + t, math.floor(getLocal().posy // 32) + 2).fg == ItemID + 1 do
							while bot.status ~= 1 do
								sleep(3000)
								if bot.status == 1 then
									sleep(4000)
									goto bckHarvestRejo
								end
							end
							bot:hit(math.floor(getLocal().posx // 32) + t, math.floor(getLocal().posy // 32) + 2)
							sleep(180)
						end
					else
						goto bckHarvestRejo
					end
				end
				if bot.status == 1 and PunchSoil == true then
					if getWorld().name == world then
						recon()
						while bot.status == 1 and bot:getWorld():getTile(math.floor(getLocal().posx // 32) + t, math.floor(getLocal().posy // 32) - 1).fg == 8644 do
							while bot.status ~= 1 do
								sleep(3000)
								if bot.status == 1 then
									sleep(4000)
									goto bckHarvestRejo
								end
							end
							bot:hit(math.floor(getLocal().posx // 32) + t, math.floor(getLocal().posy // 32) - 1)
							sleep(180)
						end
					else
						goto bckHarvestRejo
					end
				end
			end
			if bot:getInventory():findItem(ItemID) >= 100 then
				bot.auto_collect = false
				break
			else
				goto bckHarvestRejo
			end
		end
	end
	recon()
end

function breaking()
	bot:say("Breaking")
	sleep(500)
	::bckBreakIng::
	bot:warp(worldBreak.."|"..idBreak)
	sleep(3000)
	while getWorld().name ~= worldBreak do
		bot:warp(worldBreak.."|"..idBreak)
		sleep(3000)
		if getWorld().name == worldBreak then
			sleep(3000)
			if bot:getWorld():getTile(math.floor(getLocal().posx // 32), math.floor(getLocal().posy // 32)).fg == 886 then
				sleep(2000)
				break
			end
		end
		sleep(5000)
		while bot.status ~= 1 do
			sleep(3000)
			if bot.status == 1 then
				sleep(4000)
				break
			end
		end
	end
	while bot.status == 1 and bot:getInventory():findItem(ItemID) ~= nil do
		if bot.status == 1 then
			if getWorld().name == worldBreak then
				recon()
				if bot.status == 1 and bot:getWorld():getTile(math.floor(getLocal().posx // 32) - 1, math.floor(getLocal().posy // 32)).fg ~= ItemID then
					while bot.status ~= 1 do
						sleep(3000)
						if bot.status == 1 then
							sleep(4000)
							if getWorld().name ~= worldBreak then
								goto bckBreakIng
							end
							while getWorld().name == worldBreak do
								sleep(2000)
								if bot:getWorld():getTile(math.floor(getLocal().posx // 32), math.floor(getLocal().posy // 32)).fg == 6 then
									bot:warp(worldBreak.."|"..idBreak)
									sleep(5000)
								end
							end
							goto bckBreakIng
						end
					end
					bot:place(math.floor(getLocal().posx // 32) - 1, math.floor(getLocal().posy // 32), ItemID)
					sleep(120)
				end
			else
				goto bckBreakIng
			end
		end
		if bot.status == 1 then
			if getWorld().name == worldBreak then
				recon()
				if bot.status == 1 and bot:getWorld():getTile(math.floor(getLocal().posx // 32) - 1, math.floor(getLocal().posy // 32) + 1).fg ~= ItemID then
					while bot.status ~= 1 do
						sleep(3000)
						if bot.status == 1 then
							sleep(4000)
							if getWorld().name ~= worldBreak then
								goto bckBreakIng
							end
							while getWorld().name == worldBreak do
								sleep(2000)
								if bot:getWorld():getTile(math.floor(getLocal().posx // 32), math.floor(getLocal().posy // 32)).fg == 6 then
									bot:warp(worldBreak.."|"..idBreak)
									sleep(5000)
								end
							end
							goto bckBreakIng
						end
					end
					bot:place(math.floor(getLocal().posx // 32) - 1, math.floor(getLocal().posy // 32) + 1, ItemID)
					sleep(120)
				end
			else
				goto bckBreakIng
			end
		end
		for i = 1,5 do
			if bot.status == 1 then
				if bot.status == 1 then
					if getWorld().name == worldBreak then
						recon()
						if bot.status == 1 and bot:getWorld():getTile(math.floor(getLocal().posx // 32) - 1, math.floor(getLocal().posy // 32)).fg ~= 0 then
							while bot.status ~= 1 do
								sleep(3000)
								if bot.status == 1 then
									sleep(4000)
									if getWorld().name ~= worldBreak then
										goto bckBreakIng
									end
									while getWorld().name == worldBreak do
										sleep(2000)
										if bot:getWorld():getTile(math.floor(getLocal().posx // 32), math.floor(getLocal().posy // 32)).fg == 6 then
											bot:warp(worldBreak.."|"..idBreak)
											sleep(5000)
										end
									end
									goto bckBreakIng
								end
							end
							bot:hit(math.floor(getLocal().posx // 32) - 1, math.floor(getLocal().posy // 32))
							sleep(180)
						end
					else
						goto bckBreakIng
					end
				end
				if bot.status == 1 then
					if getWorld().name == worldBreak then
						recon()
						if bot.status == 1 and bot:getWorld():getTile(math.floor(getLocal().posx // 32) - 1, math.floor(getLocal().posy // 32) + 1).fg ~= 0 then
							while bot.status ~= 1 do
								sleep(3000)
								if bot.status == 1 then
									sleep(4000)
									if getWorld().name ~= worldBreak then
										goto bckBreakIng
									end
									while getWorld().name == worldBreak do
										sleep(2000)
										if bot:getWorld():getTile(math.floor(getLocal().posx // 32), math.floor(getLocal().posy // 32)).fg == 6 then
											bot:warp(worldBreak.."|"..idBreak)
											sleep(5000)
										end
									end
									goto bckBreakIng
								end
							end
							bot:hit(math.floor(getLocal().posx // 32) - 1, math.floor(getLocal().posy // 32) + 1)
							sleep(180)
						end
					else
						goto bckBreakIng
					end
				end
				bot:collect(2, 100)
				sleep(50)
			else
				break
			end
		end
		if bot.status == 1 then
			if getWorld().name == worldBreak then
				recon()
				if bot.status == 1 and bot:getWorld():getTile(math.floor(getLocal().posx // 32) - 1, math.floor(getLocal().posy // 32)).fg ~= 0 then
					while bot.status ~= 1 do
						sleep(3000)
						if bot.status == 1 then
							sleep(4000)
							if getWorld().name ~= worldBreak then
								goto bckBreakIng
							end
							while getWorld().name == worldBreak do
								sleep(2000)
								if bot:getWorld():getTile(math.floor(getLocal().posx // 32), math.floor(getLocal().posy // 32)).fg == 6 then
									bot:warp(worldBreak.."|"..idBreak)
									sleep(5000)
								end
							end
							goto bckBreakIng
						end
					end
					bot:hit(math.floor(getLocal().posx // 32) - 1, math.floor(getLocal().posy // 32))
					sleep(180)
				end
			else
				goto bckBreakIng
			end
		end
		if bot.status == 1 then
			if getWorld().name == worldBreak then
				recon()
				while bot.status == 1 and bot:getWorld():getTile(math.floor(getLocal().posx // 32) - 1, math.floor(getLocal().posy // 32) + 1).fg ~= 0 do
					while bot.status ~= 1 do
						sleep(3000)
						if bot.status == 1 then
							sleep(4000)
							if getWorld().name ~= worldBreak then
								goto bckBreakIng
							end
							while getWorld().name == worldBreak do
								sleep(2000)
								if bot:getWorld():getTile(math.floor(getLocal().posx // 32), math.floor(getLocal().posy // 32)).fg == 6 then
									bot:warp(worldBreak.."|"..idBreak)
									sleep(5000)
								end
							end
							goto bckBreakIng
						end
					end
					bot:hit(math.floor(getLocal().posx // 32) - 1, math.floor(getLocal().posy // 32) + 1)
					sleep(180)
				end
			else
				goto bckBreakIng
			end
		end
	if getBot():getInventory():findItem(ItemID) == 0 or getBot().status ~= 1 then
		break
	end
	end
	recon()
	trashs()
end

function plant()
	bot:say("Planting")
	sleep(500)
	::bckPlantRejo::
	joinWorld()
	for _, tile in pairs(getTiles()) do
		if bot.status == 1 then
			if getWorld().name == world then
				recon()
				if bot.status == 1 and tile.fg == 0 and bot:getWorld():getTile(tile.x, tile.y + 1).fg ~= 0 and bot:getWorld():getTile(tile.x, tile.y + 1).fg ~= ItemID and bot:getWorld():getTile(tile.x, tile.y + 1).fg ~= 8 and bot:getWorld():getTile(tile.x, tile.y + 1).fg ~= 222 and bot:getWorld():getTile(tile.x, tile.y + 1).fg ~= 102 then
					if getWorld().name == world then
						bot.auto_collect = true
						if bot.status == 1 and bot:getWorld():getTile(tile.x + 2, tile.y).fg == 0 then
							while bot.status ~= 1 do
							sleep(3000)
							if bot.status == 1 then
								sleep(4000)
								if getWorld().name ~= world then
									goto bckPlantRejo
								elseif getWorld().name == world then
									if bot:getWorld():getTile(math.floor(getLocal().posx // 32), math.floor(getLocal().posy // 32)).fg == 6 then
										goto bckPlantRejo
									end
								end
								goto bckPlantRejo
							end
						end
						bot:findPath(tile.x + 2, tile.y)
						sleep(200)
						end
					end
					if getWorld().name == world then
						recon()
						if bot.status == 1 and bot:getWorld():getTile(tile.x + 2, tile.y).fg ~= 0 then
							while bot.status ~= 1 do
								sleep(3000)
								if bot.status == 1 then
									sleep(4000)
									if getWorld().name ~= world then
										goto bckPlantRejo
									elseif getWorld().name == world then
										if bot:getWorld():getTile(math.floor(getLocal().posx // 32), math.floor(getLocal().posy // 32)).fg == 6 then
											goto bckPlantRejo
										end
									end
										goto bckPlantRejo
								end
							end
							bot:findPath(tile.x + 1, tile.y)
							sleep(200)
						end
					end
				end
			end
			for i, t in ipairs(angka) do
				if bot.status == 1 then
					if getWorld().name == world then
						recon()
						if bot.status == 1 and bot:getInventory():findItem(ItemID + 1) ~= nil and bot:getWorld():getTile(math.floor(getLocal().posx // 32) + t, math.floor(getLocal().posy // 32) + 1).fg == 8642 or bot:getWorld():getTile(math.floor(getLocal().posx // 32) + t, math.floor(getLocal().posy // 32) + 1).fg == 8644 or bot:getWorld():getTile(math.floor(getLocal().posx // 32) + t, math.floor(getLocal().posy // 32) + 1).fg == 8772 then
							while bot:getWorld():getTile(math.floor(getLocal().posx // 32) + t, math.floor(getLocal().posy // 32)).fg == 0 do
								while bot.status ~= 1 do
									sleep(3000)
									if bot.status == 1 then
										sleep(4000)
										if getWorld().name ~= world then
											goto bckPlantRejo
										elseif getWorld().name == world then
											if bot:getWorld():getTile(math.floor(getLocal().posx // 32), math.floor(getLocal().posy // 32)).fg == 6 then
												goto bckPlantRejo
											end
										end
										goto bckPlantRejo
									end
								end
								bot:place(math.floor(getLocal().posx // 32) + t, math.floor(getLocal().posy // 32), ItemID + 1)
								sleep(100)
								if bot:getInventory():findItem(ItemID + 1) == 0 then
									break
								end
							end
						end
					else
						goto bckPlantRejo
					end
				end
			end
			for i, t in ipairs(angka) do
				if bot.status == 1 then
					if getWorld().name == world then
						recon()
						if bot.status == 1 and bot:getInventory():findItem(ItemID + 1) ~= nil and bot:getWorld():getTile(math.floor(getLocal().posx // 32) + t, math.floor(getLocal().posy // 32) + 3).fg == 8642 or bot:getWorld():getTile(math.floor(getLocal().posx // 32) + t, math.floor(getLocal().posy // 32) + 3).fg == 8644 or bot:getWorld():getTile(math.floor(getLocal().posx // 32) + t, math.floor(getLocal().posy // 32) + 3).fg == 8772 then
							while bot:getWorld():getTile(math.floor(getLocal().posx // 32) + t, math.floor(getLocal().posy // 32) + 2).fg == 0 do
								while bot.status ~= 1 do
									sleep(3000)
									if bot.status == 1 then
										sleep(4000)
										if getWorld().name ~= world then
											goto bckPlantRejo
										elseif getWorld().name == world then
											if bot:getWorld():getTile(math.floor(getLocal().posx // 32), math.floor(getLocal().posy // 32)).fg == 6 then
												goto bckPlantRejo
											end
										end
										goto bckPlantRejo
									end
								end
								bot:place(math.floor(getLocal().posx // 32) + t, math.floor(getLocal().posy // 32) + 2, ItemID + 1)
								sleep(100)
								if bot:getInventory():findItem(ItemID + 1) == 0 then
									break
								end
							end
						end
					else
						goto bckPlantRejo
					end
				end
			end
		end
		if bot:getInventory():findItem(ItemID + 1) == 0 then
			bot.auto_collect = false
			break
		end
	end
	bot.auto_collect = false
	cekLastSeedPojok()
	recon()
	buyanddrop()
end

wb.content = getBot().name.." Starting Rotation at "..world
wb:send()
cekTanamLast = true
bot.reconnect_interval = 60
while true do
harvest()
breaking()
plant()
end
