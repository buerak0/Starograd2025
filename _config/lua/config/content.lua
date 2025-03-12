--
-- starograd and dobrograd
--
resource.AddWorkshop( "2447979470" )
resource.AddWorkshop( "3096712698" )
resource.AddWorkshop( "3096720964" )
resource.AddWorkshop( "3096723433" )
resource.AddWorkshop( "2558543740" )
resource.AddWorkshop( "" ) -- slib
resource.AddWorkshop( "3370341481" )
resource.AddWorkshop( "2114254167" ) -- screengrab
resource.AddWorkshop( "3366997363" )
resource.AddWorkshop( "2403043112" )
resource.AddWorkshop( "3382190351" )                 --https://steamcommunity.com/sharedfiles/filedetails/?id=2485178558
resource.AddWorkshop( "3150315111" )
resource.AddWorkshop( "3385692979" )
resource.AddWorkshop( "3305892788" )
resource.AddWorkshop( "3305893962" )
resource.AddWorkshop( "3366263567" )
resource.AddWorkshop( "3374690399" )
resource.AddWorkshop( "3391555259" )
resource.AddWorkshop( "3391552427" )


resource.AddFile 'resource/fonts/Roboto-Black.ttf'
resource.AddFile 'resource/fonts/Roboto-BlackItalic.ttf'
resource.AddFile 'resource/fonts/Roboto-Bold.ttf'
resource.AddFile 'resource/fonts/Roboto-BoldCondensed.ttf'
resource.AddFile 'resource/fonts/Roboto-BoldCondensedItalic.ttf'
resource.AddFile 'resource/fonts/Roboto-BoldItalic.ttf'
resource.AddFile 'resource/fonts/Roboto-Condensed.ttf'
resource.AddFile 'resource/fonts/Roboto-CondensedItalic.ttf'
resource.AddFile 'resource/fonts/Roboto-Italic.ttf'
resource.AddFile 'resource/fonts/Roboto-Light.ttf'
resource.AddFile 'resource/fonts/Roboto-LightItalic.ttf'
resource.AddFile 'resource/fonts/Roboto-Medium.ttf'
resource.AddFile 'resource/fonts/Roboto-MediumItalic.ttf'
resource.AddFile 'resource/fonts/Roboto-Regular.ttf'
resource.AddFile 'resource/fonts/Roboto-Thin.ttf'
resource.AddFile 'resource/fonts/Roboto-ThinItalic.ttf'

--
-- octolib
--
resource.AddWorkshop '1394544550' -- icons
resource.AddFile 'resource/fonts/arial.ttf'
resource.AddFile 'resource/fonts/arialbd.ttf'
resource.AddFile 'resource/fonts/arialbi.ttf'
resource.AddFile 'resource/fonts/arialblk.ttf'
resource.AddFile 'resource/fonts/ariali.ttf'
resource.AddFile 'resource/fonts/blogger.ttf'
resource.AddFile 'resource/fonts/bloggerb.ttf'
resource.AddFile 'resource/fonts/bloggerbi.ttf'
resource.AddFile 'resource/fonts/bloggeri.ttf'
resource.AddFile 'resource/fonts/bloggerl.ttf'
resource.AddFile 'resource/fonts/bloggerli.ttf'
resource.AddFile 'resource/fonts/bloggerm.ttf'
resource.AddFile 'resource/fonts/bloggermi.ttf'
resource.AddFile 'resource/fonts/fontawesome-webfont.ttf'

--
-- serverguard
--
resource.AddWorkshop '685130934'

--
-- simfphys
--
resource.AddWorkshop '771487490'

--
-- stormfox
--
resource.AddWorkshop '2447979470'

--
-- atm
--
resource.AddFile 'materials/newcity/atm.png'

resource.AddFile 'models/props_unique/atm01.mdl'
resource.AddSingleFile 'models/props_unique/atm01.dx80.vtx'
resource.AddSingleFile 'models/props_unique/atm01.dx90.vtx'
resource.AddSingleFile 'models/props_unique/atm01.mdl'
resource.AddSingleFile 'models/props_unique/atm01.phy'
resource.AddSingleFile 'models/props_unique/atm01.vtx'
resource.AddSingleFile 'models/props_unique/atm01.vvt'

resource.AddFile 'materials/models/props_unique/atm.vmt'
resource.AddSingleFile 'materials/models/props_unique/atm.vmt'
resource.AddSingleFile 'materials/models/props_unique/atm.vtf'
resource.AddSingleFile 'materials/models/props_unique/atm_ref.vtf'

--
-- fadmin (darkrp)
--
local function AddDir(dir)
	local files, folders = file.Find(dir .. "/*", "GAME")
	for _, fdir in pairs(folders) do
		if fdir ~= ".svn" then AddDir(dir .. "/" .. fdir) end
	end
	for k, v in pairs(files) do resource.AddFile(dir .. "/" .. v) end
end
AddDir("materials/fadmin")