from CRABClient.UserUtilities import config, getUsernameFromSiteDB
config = config()

#config.General.requestName = 'FCNC_MC_analysis_ST_Hct'
config.General.workArea = 'crab_projects'
#config.General.transferOutputs = True
#config.General.transferLogs = True

config.JobType.pluginName = 'Analysis'
config.JobType.psetName = 'runFlatTreeMINIAOD_cfg.py'
config.JobType.inputFiles = ['conf.xml']

config.Data.inputDataset = '/ST_TH_1L3B_Hct/kskovpen-kskovpen_ST_TH_1L3B_Hct_f0dc44844e1feaf4276c92c681b1bfa9_USER-945eeaf2bbc1c170dee4cc02592a5272/USER'
config.Data.inputDBS = 'phys03'
config.Data.splitting = 'FileBased'
config.Data.unitsPerJob = 1
#config.Data.totalUnits = 100
#config.Data.outLFNDirBase = '/store/user/%s/' % (getUsernameFromSiteDB())
#config.Data.publication = True
#config.Data.outputDatasetTag = 'CRAB3_tutorial_May2015_MC_analysis'

config.Site.storageSite = 'T2_US_Nebraska'
