# BERT-AccAlign Monolingual Word Alignment
<img src="./assets/uot_norm_cos_2.svg" alt="Alignment example by OTAlign" width="50%">

# Prerequisite
- See `src/requirements.txt`
- Please collect word alignment datasets: MultiMWA, Edinburgh++, MSR-RTE
  - Place them in a `data/` directory
  - Preprocessing codes for Edinburgh++ and MSR-RTE are in `src/preprocess`

# Self-supervised Word Alignment
For details, please refer to the arguments in `src/self-supervised_alignment.py`
``` shell
UN_OUTDIR=../out/self-supervised/
SEED=42
DATA=mtref
OT=uot
WT=uniform
DT=cos
$ python unsupervised_alignment.py --data $DATA --sure_and_possible --model bert-base-uncased --centering --pair_encode --layer -3 --out $UN_OUTDIR --ot_type $OT --weight_type $WT --dist_type $DT --seed $SEED
```