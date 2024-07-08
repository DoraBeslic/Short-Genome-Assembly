## sbatch_assembleGenome.sh
**Overview:** Assembles Rhodobacter spheroides genome  
**Author:** Isidora Beslic  
**Date created:** March 17, 2023  
**Date started:** March 14, 2023  
**Calling on the command line:** sbatch sbatch_assembleGenome.sh  

## Methods:
### getNGS.sh  
  - fasterq-dump: command-line utility to retrieve sequence data in FASTQ format from the SRA
  - --split-3: writes single reads in special file 
  - -O: outputs files to data directory   
### trim.sh  
  - trimmomatic: Java-based quality trimmer that trims reads based on quality scores and removes adapter sequences 
  - PE: indicates paired-end reads
  - -threads: indicates how many server threads to use for this job
  - -phred33: indicates the quality encoding method used for the reads
  - next two parameters are the left and right read files 
  - next four parameters are the output files for paired and unpaired output
  - HEADCROP: indicates the number of bases to remove from the beginning, regardless of quality
  - ILLUMINACLIP: specifies a file of adapter sequences and the number of mismatches allowed in an adapter match
  - LEADING: determines the minimum quality for trimming the start of reads
  - TRAILING: determiens the minimum quality for trimming the end of reads 
  - SLIDINGWINDOW: indicates the sliding window size and the minimum average quality for the bases in that window
  - MINLEN: specifies the minimum length for a read to be kept  
### runSpades.sh
  - spades.py: genome assembly program
  - -1: file with forward paired-end reads
  - -2: file with reverse paired-end reads
  - -o: output directory  
### runQuast.sh 
  - quast.py: program that runs a quality analysis on genome assemblies  
  - parameter: assembled contigs fasta file

## Conclusions from Analysis:
The key metrics for the quast analysis are GC content (%), N50, N75, L50, and L75. The N50 value represents the size of the largest contig such that the contigs larger than that comprise at least 50% of the assembled genome. Higher N50 values indicate that the genome was assembled with fewer, longer sequences, and thus represents a better quality assembly. The N50 value for my assembly is 25496. This is a good value considering Rhodobacter spheroides is a bacterium with a relatively small genome size (around 4-5 Mb). It indicates that at least 50% of the genome is contained within contigs of 25 kb or longer.
