#declare -A numbers=( ["SingleMuonB"]=1742 ["SingleElectronB"]=2712 )
#declare -A crabsps=( ["SingleMuonB"]=crab_20160922_104730 ["SingleElectronB"]=crab_20160922_122035 )

#declare -A numbers=( ["SingleMuonB"]=109                  ["SingleMuonC"]=48                   ["SingleMuonD"]=65                   ["SingleElectronB"]=170                  ["SingleElectronC"]=68                   ["SingleElectronD"]=99                   )
#declare -A crabsps=( ["SingleMuonB"]=crab_20161001_183415 ["SingleMuonC"]=crab_20161001_183442 ["SingleMuonD"]=crab_20161001_183459 ["SingleElectronB"]=crab_20161001_183516 ["SingleElectronC"]=crab_20161001_183533 ["SingleElectronD"]=crab_20161001_183554 )

declare -A numbers=( ["ST_Hut"]=498 ["ST_Hct"]=497 ["TTbar_TopLep_Hut"]=665 ["TTbar_TopLep_Hct"]=325 ["TTbar_AntiTopLep_Hut"]=353 ["TTbar_AntiTopLep_Hct"]=330 ["TTbar_SM"]=4103 )
declare -A crabsps=( ["ST_Hut"]=crab_test_ST_Hut ["ST_Hct"]=crab_test_ST_Hct ["TTbar_TopLep_Hut"]=crab_test_TTbar_TopLep_Hut ["TTbar_TopLep_Hct"]=crab_test_TTbar_TopLep_Hct ["TTbar_AntiTopLep_Hut"]=crab_test_TTbar_AntiTopLep_Hut ["TTbar_AntiTopLep_Hct"]=crab_test_TTbar_AntiTopLep_Hct ["TTbar_SM"]=crab_test_TTbar_SM )

for s in ST_Hut ST_Hct TTbar_TopLep_Hut TTbar_TopLep_Hct TTbar_AntiTopLep_Hut TTbar_AntiTopLep_Hct TTbar_SM; do

    rm -f EOS_input_${s}.txt
    touch EOS_input_${s}.txt
    N=`echo ${numbers[${s}]}`
    for i in `seq 1 $N`; do
        echo /eos/cms/store/caf/user/mdjordje/Cirkovic/FCNC/${s}_NEW/output_${i}.root >> EOS_input_${s}.txt;
    done

    /afs/cern.ch/project/eos/installation/0.3.84-aquamarine/bin/eos.select find /eos/cms/store/caf/user/mdjordje/Cirkovic/FCNC/${s}_NEW/ > eos_input_${s}.txt

    rm -f eos_input_${s}_new.txt
    touch eos_input_${s}_new.txt
    for i in `cat EOS_input_${s}.txt`
    do
        if ! grep -q "$i" eos_input_${s}.txt
        then
            echo $i >> eos_input_${s}_new.txt;
        fi
    done
    
    #for i in `seq 1 $n $N`; do
    for i in `seq 1 $N`; do
    
        if grep -q "/eos/cms/store/caf/user/mdjordje/Cirkovic/FCNC/${s}_NEW/output_${i}.root" eos_input_${s}_new.txt; then

            #UP=$((i+n-1))
            #if [ $UP -gt $N ]; then
            #    UP=$N
            #fi
            dir=`echo ${crabsps[${s}]}`
            UP=$i
            echo bsub getoutput_job_NEW.sh $dir ${i} ${UP} ${s}
            bsub getoutput_job_NEW.sh $dir ${i} ${UP} ${s}
        
        fi
        
    done

done

