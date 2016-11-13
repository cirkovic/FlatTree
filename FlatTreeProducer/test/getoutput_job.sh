cd /afs/cern.ch/work/c/cirkovic/fcnc/CMSSW_8_0_12/src
eval `scramv1 runtime -sh`
cd /afs/cern.ch/work/c/cirkovic/fcnc/CMSSW_8_0_12/src/FlatTree/FlatTreeProducer/test

source /cvmfs/cms.cern.ch/crab3/crab.sh
voms-proxy-init --voms cms --valid 192:00

URL=`mktemp -d`
crab getoutput -d crab_projects/${1} --jobids=${2}-${3} --outputpath=$URL
for i in `seq ${2} ${3}`; do
    xrdcp -f ${URL}/output_${i}.root root://eoscms.cern.ch//eos/cms/store/caf/user/mdjordje/Cirkovic/FCNC/${4}/output_${i}.root
done

