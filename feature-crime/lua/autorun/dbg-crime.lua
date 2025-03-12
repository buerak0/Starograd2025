dbg = dbg or {}
dbg.crime = dbg.crime or {}
dbg.crime.config = dbg.crime.config or {}

octolib.shared('config/dbg-crime')
octolib.include.modules('/dbg-crime')

dbg.crime.config.lockpickMinPlayTime = octolib.time.toSeconds(20, 'minutes')
dbg.crime.config.hackMinPlayTime = octolib.time.toSeconds(20, 'minutes')
