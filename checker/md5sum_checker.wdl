task checkmd5 {
  File inputFile

  command {
    /bin/check_md5sum --input-file ${inputFile}
  }

 output {
    File value = "results.json"
 }

 runtime {
   docker: "quay.io/dockstore-testing/dockstore-workflow-md5sum-tester:1.0.0"
   cpu: 1
   memory: "512 MB"
   disks: "local-disk 10 HDD"
 }
}

workflow ga4ghCheckMd5 {
 File inputFile
 call checkmd5 { input: inputFile=inputFile }
}
