# -*- coding: utf-8 -*-
module SimpleIif
  class Rows::Trans < Rows
    register("TRNS")

    @all_fields = [
      ' TRNSID',       #A unique number that identifies the transaction.
      ' TIMESTAMP',    #A second unique number that works with TRNSID to identify the transaction.
      ' TRNSTYPE',     #(Required) A keyword that identifies the type of transaction. These keywords can appear in the TRNSTYPE field:
                       #    BEGINBALCHECK: Transactions that create a beginning balance in a balance sheet account
                       #    BILL: Bills from vendors
                       #    BILL REFUND: Refunds from a vendor
                       #    CASH REFUND: Cash refunds you give to customers
                       #    CASH SALE: Sales receipts
                       #    CCARD REFUND: Refunds you receive on credit card charges
                       #    CHECK: Checks
                       #    CREDIT CARD: Charges you make on a credit card
                       #    CREDIT MEMO: Credit you give to customers for merchandise they return
                       #    DEPOSIT: Bank or money market deposits
                       #    ESTIMATES: Estimates or bids
                       #    GENERAL JOURNAL: General journal transactions
                       #    INVOICE: Invoices
                       #    PAYMENT: Customer payments
                       #    PURCHORD: Purchase orders
                       #    TRANSFER: Transfers of funds from one balance sheet account to another
      '*DATE',   #The date of the transaction. The date is always in MM/DD/YY format. For example, 1/30/94.
      '*ACCNT',    #(Required) The name of the account assigned to the transaction.
      ' NAME',   #The name of the customer, vendor, payee, or employee.
      ' CLASS',    #The name of the class that applies to the transaction. If the class is a subclass, the class name includes the names of the parent classes, beginning with the highest level class. A colon (:) separates each class name.
      '*AMOUNT',   #(Required) The amount of the transaction. Debit amounts are always positive, credit amounts are always negative.
      ' DOCNUM',   #The number of the transaction. For checks, the number is the check number; for invoices, the number is the invoice number; etc.
      ' MEMO',   #The memo text associated with the transaction.
      ' CLEAR',    #Indicates whether the transaction has cleared. These keywords can appear in the CLEAR field: Y or N
      ' TOPRINT',    #Indicates whether a check, invoice, credit memo, or sales receipt has been marked as "To be printed." These keywords can appear in the TOPRINT field: Y or N
      ' ADDR1',    #The first line of the customer's, vendor's, payee's, or employee's address.
      ' ADDR2',    #The second line of the customer's, vendor's, payee's, or employee's address.
      ' ADDR3',    #The third line of the customer's, vendor's, payee's, or employee's address.
      ' ADDR4',    #The fourth line of the customer's, vendor's, payee's, or employee's address.
      ' ADDR5',    #The fifth line of the customer's, vendor's, payee's, or employee's address.
      ' DUEDATE',    #(Bills and invoices only) The due date of the bill payment or invoice payment. The date is always in MM/DD/YY format. For example, 1/30/98.
      ' TERMS',    #(Invoices only) The terms of the invoice.
      ' PAID',   #(Invoices only) Indicates whether an invoice has been paid in full. These keywords can appear in the PAID field: Y or N
      ' PAYMETH',    #(Sales receipts only) The method your customer used to pay for the merchandise.
      ' SHIPVIA',    #(Invoices and sales receipts only) The method you used to ship the merchandise.
      ' SHIPDATE',   #(Invoices and sales receipts only) The shipping date. If you are creating an import file, enter the date in MM/DD/YY format. For example, 1/30/94.
      ' REP',    #(Invoices and sales receipts only) The initials of the sales representative or employee who made the sale.
      ' FOB',    #(Invoices, credit memos, and cash sales only) The location where you delivered the merchandise—free of charge—to a carrier for shipment.
      ' PONUM',    #(Invoices and credit memos only) The customer's purchase order number.
      ' INVTITLE',   #(Invoices, credit memos, and sales receipts only) The title that appears on the invoice, credit memo, or sales receipt.
      ' INVMEMO',    #(Invoices, credit memos, and sales receipts only) Your message to the customer—as it appears on the invoice, credit memo, or sales receipt.
      ' SADDR1',   #(Invoices and sales receipts only) The first line of the customer's shipping address.
      ' SADDR2',   #(Invoices and sales receipts only) The second line of the customer's shipping address.
      ' SADDR3',   #(Invoices and sales receipts only) The third line of the customer's shipping address.
      ' SADDR4',   #(Invoices and sales receipts only) The fourth line of the customer's shipping address.
      ' SADDR5',   #(Invoices and sales receipts only) The fifth line of the customer's shipping address.
      ' NAMEISTAXABLE',    #(Invoices and sales receipts only) Indicates whether the customer whose name appears in the transaction is taxable. Y or N
    ]

    def closing_row_name
      'ENDTRNS'
    end

  end
end
