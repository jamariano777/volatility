# 🕵️‍♂️ Memory Forensics Lab with Volatility  

This lab walks through **dumping RAM**, verifying file integrity, and analyzing system activity with **Volatility**.  



# CHECK SUM windows server 

```bash
certutil -hashfile SERVER_EVAL_x64FRE_en-us.iso SHA256
```

<img width="1139" height="450" alt="image" src="https://github.com/user-attachments/assets/d9dd1ca3-a897-4ac7-8a17-0b9b1ae4354f" />




# Clone this volatility repository
* Clone this repo on C:\Tools Directory

```
git clone https://github.com/magdeil/volatility
```



# Add another Netwrok Adapter 
* Bridge Network and replicate it

# Install Python on VMware and necessary pip modules

* check 1st the volatility if there are frameworks that are not working that means some of the pip modules of python are not yet installed

```bash
python vol.py -h
```

### If some frameworks are not working then install the pip modules

```bash
python -m pip install yara yara_x pycryptodome pefile
```


# Open tabs in msedge
* 2 non-private and 1 or 2 private tabs

<img width="960" height="464" alt="image" src="https://github.com/user-attachments/assets/783fb894-acfc-4671-a1ae-a096c90bafb9" />

<img width="980" height="640" alt="image" src="https://github.com/user-attachments/assets/ef8cb73d-0fa9-4587-b4b7-2c9f64613dbb" />


# Dump ram 
* open folder tools in vmware AzureAD
* Or open CMD and change directory to tools
```
cd C:\Tools\volatility
```
* then type dir to show lists of directories

<img width="964" height="793" alt="image" src="https://github.com/user-attachments/assets/cdb56d6d-45e1-4b04-a115-630a8a8ded26" />

# Using Dumpit.exe we will dump all the saved raw webpage datas
<img width="996" height="734" alt="image" src="https://github.com/user-attachments/assets/6ef6c0b9-dff8-4e3f-a0ca-e980355bb8fd" />

# After it is done it will show hash code for the raw or dmp file
<img width="946" height="378" alt="image" src="https://github.com/user-attachments/assets/0d27e5f1-7b32-45b6-ab05-894a3dafcaec" />

use certutil to confirm the hash file if identical
<img width="1858" height="725" alt="image" src="https://github.com/user-attachments/assets/311dc4cc-6fb1-4c90-a8b2-e346a4efcfb7" />

# Checking system info using volatilty

```bash
python vol.py -f "C:\Tools\volatility\<generated .dmp file>" windows.info
```
<img width="964" height="776" alt="image" src="https://github.com/user-attachments/assets/e6d88a5b-66b8-444b-a276-a00b2b3b0d81" />

# Using pslist to capture process lists from ram

```
python vol.py -f <generated dmp file> windows.pslist
```
### REMEMBER TO GET PID LIST OF EDGE 
* complete process list from the memory dump - showing every running process on the system at the time of capture!

"This is like Task Manager, but for a frozen moment in time - and it can't be lied to!"

"The Hierarchy of Trust:"

* PID 4 is always System - the ultimate parent
* Most processes spawn from smss.exe → csrss.exe → wininit.exe/services.exe
* This is normal Windows process tree structure

"This is crucial for:

* Incident Response: Finding malicious processes
* Baseline Analysis: Knowing what 'normal' looks like

<img width="1204" height="835" alt="image" src="https://github.com/user-attachments/assets/96a0358a-b241-4df8-b8e2-5e9b391b70ca" />


#  Using Netstat to map network activity
* a complete map of all network activity on the machine at the time of the incident
```
python vol.py -f <generated .dmp file> windows.netstat
```
<img width="1662" height="665" alt="image" src="https://github.com/user-attachments/assets/b0acd56e-c80c-4386-b50b-83df1df6f42f" />

# network connection analysis using netscan
* network connection analysis on a memory dump, revealing all active network connections and listening ports at the time the memory was captured.
```
python vol.py -f "<generated .dmp file>" windows.netscan
```

# 1 MORE DUMP OF MEMORY BUT WITH THE PRIVATE BROWSER CLOSED

```
python vol.py -f <generated dmp file> windows.netscan
```

# Accept EULA terms and condition for strings.exe 
## Using strings.exe to execute raw webpages files
```
strings.exe
```

# raw web content, URLs, and potentially sensitive data
Loaded in memory when the system was running. This includes:

1. Complete Web Pages - HTML, CSS, JavaScript that were loaded in browsers
2. HTTP Requests/Responses - Headers, cookies, form data
3. URLs and API Endpoints - Every website visited
4. Cookies and Session Tokens - Authentication data
5. JavaScript Code - Both legitimate and potentially malicious !!!  If a malicious site was visited, we can see the actual payload" !!!
   
<img width="972" height="740" alt="image" src="https://github.com/user-attachments/assets/6e1ae6ee-b560-48a3-9e60-a1c5fd166f80" />

# Forensic evidence of browser activity using yarascan
* Extracted URLs from Microsoft Edge's memory
* "This is like finding the browser's memory diary - every website it ever loaded!"

### using url rule
```
python vol.py -f <generated dmp file> windows.vadyarascan --pid <msedge id> --yara-file urls.yar | more
```
<img width="1509" height="682" alt="image" src="https://github.com/user-attachments/assets/eff2fb6e-2cb7-47ac-bd19-a1df91d8a3c3" />


### using keywords rule
```
python vol.py -f <generated dmp file> windows.vadyarascan --pid <msedge id> --yara-file keywords.yar | more
```
<img width="1585" height="683" alt="image" src="https://github.com/user-attachments/assets/51f30525-90e6-4e17-81a2-d8e6819e1653" />
