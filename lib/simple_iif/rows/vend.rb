module SimpleIif
  class Rows::Vend < Rows
    register("VEND")

    @all_fields = [
      '*NAME',       #(Required) The name of the vendor.
      ' TIMESTAMP',  #(Export files only) A unique number that identifies the company file from which you exported the Vendor list.
      ' REFNUM',     #(Export files only) A unique number that identifies an entry in the list.
      '*PRINTAS',    #The name you would like checks to be made out to. This field allows you to make checks out to a different name than the name that appears on your Vendor list.
      '*ADDR1',      #The first line of the vendor's address.
      '*ADDR2',      #The second line of the vendor's address.
      ' ADDR3',      #The third line of the vendor's address.
      ' ADDR4',      #The fourth line of the vendor's address.
      ' ADDR5',      #The fifth line of the vendor's address.
      '*VTYPE',      #Your classification for the vendor (QuickBooks calls this a "vendor type"). If you import a vendor type that is not on your Vendor Type list, QuickBooks adds the new vendor type to the list.
      ' CONT1',      #The name of your primary contact with the vendor.
      ' PHONE1',     #The vendor's phone number.
      ' PHONE2',     #The vendor's alternate phone number.
      ' FAXNUM',     #The vendor's FAX number.
      ' TAXID',      #The vendor's tax identification number.
      ' LIMIT',      #Your credit limit with the vendor. If you are creating an import file, enter the dollar amount.
      ' TERMS',      #Your payment terms with the vendor.
      ' NOTEPAD',    #Your notes about the vendor. If you are creating an import file, the notes appear in the Notepad window for the vendor.
      ' SALUTATION', #The vendor's salutation, or title (Mr., Ms., Doctor, etc.).
      ' COMPANYNAME',#The name of the vendor's company.
      '*FIRSTNAME',  #The vendor's first name.
      ' MIDINIT',    #The vendor's middle initial.
      '*LASTNAME',   #The vendor's last name.
      ' CUSTFLD1',   #CUSTFLD2
      ' CUSTFLD2',   #CUSTFLD2
      ' CUSTFLD3',   #CUSTFLD2
      ' CUSTFLD4',   #CUSTFLD2
      ' CUSTFLD5',   #CUSTFLD2
      ' CUSTFLD6',   #CUSTFLD2
      ' CUSTFLD7',   #The custom field entries for the vendor (you can have up to 7 custom field entries). Custom fields let you track special information about the vendor, such as the vendor's birthday or e-mail address. What you use custom fields for is entirely up to you.
      '*1099',       #Indicates whether you file a 1099-MISC form for this vendor. If you are creating an import file, enter one of these keywords in the 1099 field:
      ' NOTE',       #The name or number of the account you want to associate with this vendor. QuickBooks requires an account number if you want to set up this vendor as an online payee. The payee uses this number to identify you.
    ]

  end
end
