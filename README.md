We needed to configure the download folders of everyone in the organization to delete old files automatically. We initially tried to use Storage Sense, via an Intune configuration profile. 
This didn't work because storage sense deletes files based on their last accessed date and our anti-virus was accessing the files everyday during scheduled scans. 

This script can be deployed with Intune in leui of or in conjunction with Storage Sense. 
![image](https://github.com/CyberSkyler/CleanDownloadsTaskScheduler/assets/153866716/bcd5a452-d090-4744-a426-fd60bad035b7)
