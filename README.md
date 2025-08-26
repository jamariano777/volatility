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
python vol.py
```

### If some frameworks are not working then install the pip modules

```bash
python -m pip install yara yara_x pycryptodome pefile
```
