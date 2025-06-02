process DownsampleFastq {
    tag "$sample_id"

    input:
    tuple val(sample_id), path(reads)
    output:
    tuple val(sample_id), path("*.fastq.gz")

    script:
    """
    for f in ${reads}*.fastq.gz; do
        base=\$(basename \$f .fastq.gz)
        seqtk sample -s100 \$f 0.5 > \${base}_x0.5.fastq
        seqtk sample -s100 \$f 0.25 > \${base}_x0.25.fastq
        seqtk sample -s100 \$f 0.125 > \${base}_x0.125.fastq
        seqtk sample -s100 \$f 0.0625 > \${base}_x0.0625.fastq
        gzip \${base}_x*.fastq
    done
    """
}
