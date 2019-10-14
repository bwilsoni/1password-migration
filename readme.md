# Notes on migrating passwords from iCloud Keychain to 1Password

I recently became interested in trying to export a copy of the passwords I had in iCloud keychain to some other password manager. Mostly to enable cross-browser password auto-fill support. I assessed a few password managers, and found that 1Password seemed to have the most documentation I could find online in regards to migrating from keychain.

I started down the rabbit hole of trying to find a solution for migrating, and discovered that migrating anything out of iCloud keychain was going to be difficult, because as much as I love them...Apple. 

I eventually landed on [this possible solution](https://discussions.agilebits.com/discussion/comment/455708/#Comment_455708). It's not particular quick, and is automating the process of exporting passwords via the GUI, so certainly not the most secure or elegant solution. But the one that ended up working for me.

Based on the [how to create a 1Password compatible CSV file](https://support.1password.com/create-csv-files/) article. I modified the applescript somewhat to more align with the 1Password CSV format. The CSV that's created contains fields for `title,website,username,password` NO notes or optional fields are programmaticaly created as a part of this automation. 

*Note* -- If you hear the sound of a mistyped key while the applescript is running, that will likely lead to an import error in 1Password. I found that this indicates  some key press was erroneously saved into the CSV data. I was able to identify the issue by previewing the file and seeing the extra column field that was created. My CSV required a little cleanup to import properly into 1Password.

# Instructions

1. Open Grab-Password.applescript in Script Editor.app
2. Modify line 107 of the applescript, replace the `"PASSWORD-HERE"` text with the password required to unlock your iCloud keychain. For me this was my Mac's local user login password.
3. Modify Line 1 of the applescript, `repeat 1 times`, replace the `1` with number of items you would like to iterate through. The author of the original script recommends starting small, less than 50 and expanding after some trial and error. I had ~250 items, and see no reason you couldn't bump this number higher. 
4. Launch TextEdit.app, and open a new document, switch to plain text (Format -> Make Plain Text), leave window open
5. Open Keychain Access.app, select iCloud under Keychains menu, sort passwords as desired, make sure top item is selected as active "highlighted blue" in keychain access. This is where the automation will start from.
6. Run script from script editor.
7. Let script run, don't hit any buttons or click anything with the mouse. The GUI is being automated, and input could interfere with the process.
8. The script should be opening and closing keychain windows, and pasting information into the open TextEdit.app window.
9. Once script is finished running, and the necessary data is in the TextEdit.app window save the file as a .csv.
10. Do with the .csv as you wish, for example importing into 1Password.

## Optional
iCloud keychain seems to include the username in the "Name" field for keychain items. This is extraneous data and does not look good when imported into 1Password. Running the filter.sh on the .csv file will remove the extraneous data.
1. In Terminal `./filter.sh INPUT.csv OUTPUT.csv`
2. Use the OUTPUT.csv to import passwords into 1Password