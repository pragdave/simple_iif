module SimpleIif
  class Rows::Spl < Rows

    register("SPL")

    @all_fields = [
      ' SPLID',      #(Required) A unique number that identifies the distribution line in the transaction.
      ' TRNSTYPE',   #A keyword that indicates the type of transaction. The keyword in this field must match the keyword in the TRNSTYPE field for the transaction. The keyword will be one of the following:
                     #    BILL: Bills from vendors
                     #    CHECK: Checks
                     #    DEPOSIT: Bank or money market deposits
                     #    INVOICE: Invoices
                     #    PAYMENT: Customer payments
      ' DATE',       #The date of the transaction. The date in this field must match the date in the DATE field for the transaction.
      '*ACCNT',      #(Required) The income or expense account to which you assigned the amount on the distribution line.
      ' NAME',       #The name of the customer, vendor, payee, or employee.
      ' CLASS',      #The name of the class that applies to the distribution amount. If the class is a subclass, the class name includes the names of the parent classes, beginning with the highest level class. A colon (:) separates each class name.
      '*AMOUNT',     #(Required) The distribution amount. Credit amounts are negative.
      ' DOCNUM',     #The number of the transaction. For checks, the number is the check number; for invoices, the number is the invoice number, etc.
      ' MEMO',       #The memo text associated with the distribution line.
      ' CLEAR',      #Indicates whether the distribution amount has cleared. These keywords can appear in the CLEAR field: Y or N
      ' PRICE',      #The unit cost of the item.
      ' QNTY',       #The number of items sold. This value is part of a line item on an invoice, credit memo, or sales receipt.
      ' INVITEM',    #The type of items sold. This value is part of a line item on an invoice, credit memo, or sales receipt.
      ' PAYMETH',    #On a sales receipt, indicates the method of payment (check, credit card, etc.) that the customer used.
      ' TAXABLE',    #Indicates that a line item on an invoice, credit memo, or sales receipt is taxable.
      ' REIMBEXP',   #Indicates the status of the distribution amount as a reimbursable expense. These codes can appear under REIMBEXP:
                    #    NONEED: Indicates that the distribution amount does not qualify as a reimbursable expense.
                    #    NOTHING: Indicates that the distribution amount can be billed to a customer as a reimbursable expense.
                    #    THISWAS: Indicates that the distribution amount is a reimbursable expense that appears on an invoice or sales receipt.
                    #    HASBEEN: Identifies a distribution amount on a check that has been billed to a customer as a reimbursable expense.
                    #    EXTRA: Adds additional information about the distribution line. These keywords can appear in the EXTRA field:
 
      ' ENDGRP',     #(Invoices, credit memos, and sales receipts only) Indicates that the distribution line is the last item of an invoice item group.
      ' AUTOSTAX',   #Identifies a sales tax item as the automatic tax rate you set up for your QuickBooks company.
      ' VALDAJ',     #(Inventory) Indicates whether the amount in a detail line is an inventory value adjustment. Y or N
    ]
  end
end
