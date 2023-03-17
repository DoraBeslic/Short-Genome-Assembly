#!/usr/bin/env bash
# runQuast.sh

function Quast {
    quast.py ../results/rhodo/contigs.fasta  
}

mv quast_results ../results

Quast
