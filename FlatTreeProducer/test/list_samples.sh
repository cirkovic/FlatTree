declare -A nfiles=(
    ["ST_Hut_NEW"]="498"
    ["ST_Hct_NEW"]="497"
    ["TTbar_TopLep_Hut_NEW"]="665"
    ["TTbar_TopLep_Hct_NEW"]="325"
    ["TTbar_AntiTopLep_Hut_NEW"]="353"
    ["TTbar_AntiTopLep_Hct_NEW"]="330"
    ["TTbar_SM_NEW"]="4103"
    ["SingleMuonB"]="1742"
    ["SingleMuonC"]="756"
    ["SingleMuonD"]="1035"
    ["SingleElectronB"]="2712"
    ["SingleElectronC"]="1080"
    ["SingleElectronD"]="1569"
)

declare -A nfiles=(
    ["ST_Hut_NEW"]="498"
    ["ST_Hct_NEW"]="497"
    ["TTbar_TopLep_Hut_NEW"]="665"
    ["TTbar_TopLep_Hct_NEW"]="325"
    ["TTbar_AntiTopLep_Hut_NEW"]="353"
    ["TTbar_AntiTopLep_Hct_NEW"]="330"
    ["TTbar_SM_NEW"]="4103"
    ["SingleMuonB"]="109"
    ["SingleMuonC"]="48"
    ["SingleMuonD"]="65"
    ["SingleElectronB"]="170"
    ["SingleElectronC"]="68"
    ["SingleElectronD"]="99"
)


#declare -A nfiles=(
#    ["ST_Hct"]="497"
#)

#for i in ST_Hct ST_Hut TTbar_TopLep_Hut TTbar_AntiTopLep_Hut TTbar_TopLep_Hct TTbar_AntiTopLep_Hct TTbar_SM; do
for s in "${!nfiles[@]}"; do
    echo $s ${nfiles[$s]} `eos ls /eos/cms/store/caf/user/mdjordje/Cirkovic/FCNC/${s} | wc -l` `eos ls /eos/cms/store/caf/user/mdjordje/Cirkovic/FCNC/${s}_Ntuple | wc -l`
    Nf1=0
    Nf2=0
    #PS=""
    LS1="" && LS1=`eos ls /eos/cms/store/caf/user/mdjordje/Cirkovic/FCNC/${s}/`
    LS2="" && LS2=`eos ls /eos/cms/store/caf/user/mdjordje/Cirkovic/FCNC/${s}_Ntuple/`
    ls1=""
    ls2=""
    for k in `seq 1 ${nfiles[$s]}`; do
        #LS1="" && LS1=`eos ls /eos/cms/store/caf/user/mdjordje/Cirkovic/FCNC/${s}/output_${k}.root` && if [[ $LS1 == "" ]]; then Nf=$((Nf+1)); fi #&
        #PS="$PS $!"
        if [[ $LS1 != *"output_${k}.root"* ]]; then ls1="$ls1 output_${k}.root"; Nf1=$((Nf1+1)); fi
        #LS2="" && LS2=`eos ls /eos/cms/store/caf/user/mdjordje/Cirkovic/FCNC/${s}_Ntuple/output_${k}.root` && if [[ $LS2 == "" ]]; then Nf=$((Nf+1)); fi #&
        #PS="$PS $!"
        if [[ $LS2 != *"output_${k}.root"* ]]; then ls2="$ls2 output_${k}.root"; Nf2=$((Nf2+1)); fi
        #echo $LS1 $Nf1 $LS2 $Nf2
    done
    #wait $PS
    echo "["$ls1"]"
    echo "["$ls2"]"
done

