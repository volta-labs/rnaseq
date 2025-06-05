// main_downsampled.nf

nextflow.enable.dsl=2

include { RNASEQ as rnaseq } from './main'
include { downsample_and_run } from './workflows/rnaseq_downsampling.nf'

workflow {
    downsample_and_run()
}
