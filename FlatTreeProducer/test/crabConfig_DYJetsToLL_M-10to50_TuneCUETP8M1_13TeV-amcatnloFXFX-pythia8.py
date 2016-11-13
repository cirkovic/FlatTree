from CRABClient.UserUtilities import config, getUsernameFromSiteDB
config = config()

#config.General.requestName = 'FCNC_MC_analysis_TTbar_Hct_1'
config.General.workArea = 'crab_projects'
#config.General.transferOutputs = True
#config.General.transferLogs = True

config.JobType.pluginName = 'Analysis'
config.JobType.psetName = 'runFlatTreeMINIAOD_cfg.py'
config.JobType.inputFiles = ['conf.xml']

#config.Data.inputDataset = '/TT_TuneCUETP8M1_13TeV-powheg-pythia8/RunIISpring16MiniAODv1-PUSpring16_80X_mcRun2_asymptotic_2016_v3_ext4-v1/MINIAODSIM'
config.Data.inputDataset = '/DYJetsToLL_M-10to50_TuneCUETP8M1_13TeV-amcatnloFXFX-pythia8/RunIISpring16MiniAODv1-PUSpring16_80X_mcRun2_asymptotic_2016_v3-v1/MINIAODSIM'
#config.Data.inputDBS = 'phys03'
config.Data.splitting = 'FileBased'
config.Data.unitsPerJob = 1
#config.Data.totalUnits = 100
#config.Data.outLFNDirBase = '/store/user/%s/' % (getUsernameFromSiteDB())
#config.Data.publication = True
#config.Data.outputDatasetTag = 'CRAB3_tutorial_May2015_MC_analysis'

config.Site.storageSite = 'T2_HU_Budapest'
