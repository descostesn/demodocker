SAMPLENAMES=["A","B"]

rule all:
  input:
    expand("results/{sampleName}.txt", sampleName=SAMPLENAMES)


rule echofile:
  input:
    "samples/{sampleName}.txt"
  output:
    "results/{sampleName}.txt"
  conda: "conda/samtools.yaml"
  shell:
    "cat {input} > {output}"
