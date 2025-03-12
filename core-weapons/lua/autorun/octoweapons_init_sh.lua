local function addWeaponSound(soundName, path, distantPath, silenced)
	sound.Add({
		name = soundName,
		channel = CHAN_USER_BASE + 10,
		volume = 1,
		sound = path,
		pitch = {95, 105},
		level = 75,
	})

	if distantPath then
		sound.Add({
			name = soundName .. '-distant',
			channel = CHAN_USER_BASE + 11,
			volume = silenced and 0.05 or 1,
			sound = distantPath,
			pitch = {95, 105},
			level = silenced and 85 or 95,
		})
	end
end

addWeaponSound('beanbag.fire', 'weapons/beanbag/beanbagfire.wav', 'weapons/beanbag/beanbagfire.wav', true)
addWeaponSound('ak47.fire', 'weapons-new/assault_rifles/ak_74/ak_74_shot.wav', 'weapons-new/assault_rifles/ak_74/ak_74_shot_distant.wav')
addWeaponSound('aug.fire', 'dbg/weapons/aug/aug-1.wav', 'dbg/weapons/aug/aug-1-distant.wav')
addWeaponSound('awp.fire', 'dbg/weapons/awp/awm-1.wav', 'dbg/weapons/awp/awm-1-distant.wav')
addWeaponSound('deagle.fire', 'dbg/weapons/deagle/deagle-1.wav', 'dbg/weapons/deagle/deagle-1-distant.wav')
addWeaponSound('elite.fire', 'dbg/weapons/elite/elite-1.wav', 'dbg/weapons/elite/elite-1-distant.wav')
addWeaponSound('famas.fire', 'dbg/weapons/famas/famas-1.wav', 'dbg/weapons/famas/famas-1-distant.wav')
addWeaponSound('fiveseven.fire', 'dbg/weapons/fiveseven/fiveseven-1.wav', 'dbg/weapons/fiveseven/fiveseven-1-distant.wav')
addWeaponSound('g3sg1.fire', 'dbg/weapons/g3sg1/g3sg1-1.wav', 'dbg/weapons/g3sg1/g3sg1-1-distant.wav')
addWeaponSound('galil.fire', 'dbg/weapons/galil/galil-1.wav', 'dbg/weapons/galil/galil-1-distant.wav')
addWeaponSound('glock.fire', 'weapons-new/pistols/glock-17/glock_17_shot.wav', 'weapons-new/pistols/glock-17/glock_17_shot_distant.wav')
addWeaponSound('glock18.fire', 'weapons-new/pistols/glock-17/glock_17_shot.wav', 'weapons-new/pistols/glock-17/glock_17_shot_distant.wav')
addWeaponSound('m249.fire', 'dbg/weapons/m249/m249-1.wav', 'dbg/weapons/m249/m249-1-distant.wav')
addWeaponSound('m3.fire', 'weapons-new/shotguns/m3/m3_super_90_shot.wav', 'weapons-new/shotguns/m3/m3_super_90_shot_distant.wav')
addWeaponSound('m3nova.fire', 'dbg/weapons/m3/nova-1.wav', 'dbg/weapons/m3/nova-1-distant.wav')
addWeaponSound('m4a1.fire', 'weapons-new/assault_rifles/m4a1/m4a1_shot.wav', 'weapons-new/assault_rifles/m4a1/m4a1_shot_distant.wav')
addWeaponSound('ar_15.fire', 'weapons-new/assault_rifles/ar_15_shot.wav', 'weapons-new/assault_rifles/ar_15_shot_distant.wav')
addWeaponSound('m4a1s.fire', 'dbg/weapons/m4a1/m4a1_1s.wav', 'dbg/weapons/m4a1/m4a1_1s_distant.wav', true)
addWeaponSound('mac10.fire', 'dbg/weapons/mac10/mac10-1.wav', 'dbg/weapons/mac10/mac10-1-distant.wav')
addWeaponSound('mp5navy.fire', 'weapons-new/smg/mp5/mp5_shot.wav', 'weapons-new/smg/mp5/mp5_shot_distant.wav')
addWeaponSound('p228.fire', 'weapons-new/pistols/p226/p226_shot.wav', 'weapons-new/pistols/p226/p226_shot_distant.wav')
addWeaponSound('p90.fire', 'dbg/weapons/p90/p95-1.wav', 'dbg/weapons/p90/p95-1_distant.wav')
addWeaponSound('revolver.fire', 'dbg/weapons/revolver/revolver-1_01.wav', 'dbg/weapons/revolver/revolver-1_distant.wav')
addWeaponSound('scout.fire', 'dbg/weapons/scout/ssg08-1.wav', 'dbg/weapons/scout/ssg08-1-distant.wav')
addWeaponSound('sg550.fire', 'dbg/weapons/sg550/sg550-1.wav', 'dbg/weapons/sg550/sg550-1-distant.wav')
addWeaponSound('sg552.fire', 'dbg/weapons/sg552/sg556-1.wav', 'dbg/weapons/sg552/sg556-1-distant.wav')
addWeaponSound('tmp.fire', 'weapons-new/smg/tmp/tmp_shot.wav', 'weapons-new/smg/tmp/tmp_shot_distant.wav', true)
addWeaponSound('ump45.fire', 'dbg/weapons/ump45/ump45-1.wav', 'dbg/weapons/ump45/ump45-1-distant.wav')
addWeaponSound('usp.fire', 'weapons-new/pistols/hk_usp/hk_usp_shot.wav', 'weapons-new/pistols/hk_usp/hk_usp_shot_distant.wav')
addWeaponSound('usps.fire', 'weapons-new/pistols/hk_usp/hk_usp_shot_s.wav', 'weapons-new/pistols/hk_usp/hk_usp_shot_s_distant.wav', true)
addWeaponSound('xm1014.fire', 'dbg/weapons/xm1014/xm1014-1.wav', 'dbg/weapons/xm1014/xm1014-1-distant.wav')
addWeaponSound('tompson.fire', 'weapons-new/smg/thompson/thompson_shot.wav', 'weapons-new/smg/thompson/thompson_reload.wav', 'weapons-new/smg/thompson/thompson_shot_distant.wav')
addWeaponSound('ar15.fire', 'weapons-new/assault_rifles/ar_15/ar_15_shot.wav', 'weapons-new/assault_rifles/ar_15/ar_15_reload.wav', 'weapons-new/assault_rifles/ar_15/ar_15_shot_distant.wav')
addWeaponSound('hk416.fire', 'weapons-new/assault_rifles/hk416/hk416_shot.wav', 'weapons-new/assault_rifles/hk416/hk416_reload.wav')
addWeaponSound('snipersupples.fire', 'weapons-new/sniper_rifles/remington_700/remington_700_shot_s.wav', 'weapons-new/sniper_rifles/remington_700/remington_700_shot_s_distant.wav')
addWeaponSound('m9.fire', 'weapons-new/pistols/beretta_92/beretta_92_shot.wav', 'weapons-new/pistols/beretta_92/beretta_92_shot_distant.wav')
addWeaponSound('1991.fire', 'weapons-new/pistols/m1911/1911_shot.wav', 'weapons-new/pistols/m1911/1911_shot_distant.wav')
addWeaponSound('fiveseven4.fire', 'weapons-new/pistols/five-seven/five-seven_shot.wav', 'weapons-new/pistols/five-seven/five-seven_shot_distant.wav')  
addWeaponSound('waltherp38.fire', 'weapons-new/pistols/waltherp38/waltherp38_shot.wav', 'weapons-new/pistols/waltherp38/waltherp38_shot_distant.wav')  
 

