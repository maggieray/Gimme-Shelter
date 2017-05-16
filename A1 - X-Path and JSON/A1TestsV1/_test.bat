ECHO TEST T0
.\A1.EXE /FILE-XML MyCustomers.xml Customers/Customer @CustomerID @CustomerID /FILE-XML MyOrders.xml Orders/Order @CID @OrderID
PAUSE

fc /L /N testfiles\T0_LeftSeq.xml _LeftSeq.xml
fc /L /N testfiles\T0_RightSeq.xml _RightSeq.xml
fc /L /N testfiles\T0_InnerJoin.xml _InnerJoin.xml
fc /L /N testfiles\T0_GroupJoin.xml _GroupJoin.xml
fc /L /N testfiles\T0_LeftOuterJoin.xml _LeftOuterJoin.xml
PAUSE

ECHO TEST T1
.\A1.EXE /FILE-XML Orders.xml Orders/Order OrderID OrderID /FILE-XML OrderDetails.xml OrderDetails/OrderDetail OrderID OrderDetailID
PAUSE

fc /L /N testfiles\T1_LeftSeq.xml _LeftSeq.xml
fc /L /N testfiles\T1_RightSeq.xml _RightSeq.xml
fc /L /N testfiles\T1_InnerJoin.xml _InnerJoin.xml
fc /L /N testfiles\T1_GroupJoin.xml _GroupJoin.xml
fc /L /N testfiles\T1_LeftOuterJoin.xml _LeftOuterJoin.xml
PAUSE

ECHO TEST T2
.\A1.EXE /FILE-JSON Orders.json root/value OrderID OrderID /FILE-XML OrderDetails.xml OrderDetails/OrderDetail OrderID OrderDetailID
PAUSE

fc /L /N testfiles\T2_LeftSeq.xml _LeftSeq.xml
fc /L /N testfiles\T2_RightSeq.xml _RightSeq.xml
fc /L /N testfiles\T2_InnerJoin.xml _InnerJoin.xml
fc /L /N testfiles\T2_GroupJoin.xml _GroupJoin.xml
fc /L /N testfiles\T2_LeftOuterJoin.xml _LeftOuterJoin.xml
PAUSE

ECHO TEST T3
.\A1.EXE /URL-JSON "http://services.odata.org/Northwind/Northwind.svc/Orders()?$orderby=OrderID desc&$select=OrderID,CustomerID,EmployeeID&$format=json" root/value OrderID OrderID /FILE-XML OrderDetails.xml OrderDetails/OrderDetail OrderID OrderDetailID
PAUSE

fc /L /N testfiles\T3_LeftSeq.xml _LeftSeq.xml
fc /L /N testfiles\T3_RightSeq.xml _RightSeq.xml
fc /L /N testfiles\T3_InnerJoin.xml _InnerJoin.xml
fc /L /N testfiles\T3_GroupJoin.xml _GroupJoin.xml
fc /L /N testfiles\T3_LeftOuterJoin.xml _LeftOuterJoin.xml
PAUSE

ECHO TEST T4
.\A1.EXE /FILE-XML PurchaseReportSample.xml PurchaseReport/parts/part partno partno /FILE-XML PurchaseReportSample.xml PurchaseReport/orders/partref partno zipcode
PAUSE

fc /L /N testfiles\T4_LeftSeq.xml _LeftSeq.xml
fc /L /N testfiles\T4_RightSeq.xml _RightSeq.xml
fc /L /N testfiles\T4_InnerJoin.xml _InnerJoin.xml
fc /L /N testfiles\T4_GroupJoin.xml _GroupJoin.xml
fc /L /N testfiles\T4_LeftOuterJoin.xml _LeftOuterJoin.xml
PAUSE


ECHO TEST T5
.\A1.EXE /FILE-XML PurchaseReportSample.xml PurchaseReport/parts/part partno partno /FILE-XML PurchaseReportSample.xml PurchaseReport/orders/partref partno @quantity
PAUSE

fc /L /N testfiles\T5_LeftSeq.xml _LeftSeq.xml
fc /L /N testfiles\T5_RightSeq.xml _RightSeq.xml
fc /L /N testfiles\T5_InnerJoin.xml _InnerJoin.xml
fc /L /N testfiles\T5_GroupJoin.xml _GroupJoin.xml
fc /L /N testfiles\T5_LeftOuterJoin.xml _LeftOuterJoin.xml
PAUSE


ECHO TEST T6
.\A1.EXE /FILE-XML PurchaseReportSample.xml PurchaseReport/parts/part partno @type /FILE-XML PurchaseReportSample.xml PurchaseReport/orders/partref partno zipcode
PAUSE

fc /L /N testfiles\T6_LeftSeq.xml _LeftSeq.xml
fc /L /N testfiles\T6_RightSeq.xml _RightSeq.xml
fc /L /N testfiles\T6_InnerJoin.xml _InnerJoin.xml
fc /L /N testfiles\T6_GroupJoin.xml _GroupJoin.xml
fc /L /N testfiles\T6_LeftOuterJoin.xml _LeftOuterJoin.xml
PAUSE


ECHO TEST T7
.\A1.EXE /URL-JSON "http://services.odata.org/Northwind/Northwind.svc/Orders()?$select=OrderID,CustomerID,EmployeeID&$format=json" root/value OrderID OrderID /FILE-XML OrderDetails.xml OrderDetails/OrderDetail OrderID OrderDetailID
PAUSE

fc /L /N testfiles\T7_LeftSeq.xml _LeftSeq.xml
fc /L /N testfiles\T7_RightSeq.xml _RightSeq.xml
fc /L /N testfiles\T7_InnerJoin.xml _InnerJoin.xml
fc /L /N testfiles\T7_GroupJoin.xml _GroupJoin.xml
fc /L /N testfiles\T7_LeftOuterJoin.xml _LeftOuterJoin.xml
PAUSE


ECHO TEST T8
.\A1.EXE /FILE-JSON orders.json root/value OrderID OrderID /FILE-XML OrderDetails.xml OrderDetails/OrderDetail OrderID OrderDetailID
PAUSE

fc /L /N testfiles\T8_LeftSeq.xml _LeftSeq.xml
fc /L /N testfiles\T8_RightSeq.xml _RightSeq.xml
fc /L /N testfiles\T8_InnerJoin.xml _InnerJoin.xml
fc /L /N testfiles\T8_GroupJoin.xml _GroupJoin.xml
fc /L /N testfiles\T8_LeftOuterJoin.xml _LeftOuterJoin.xml
PAUSE


ECHO TEST T9
.\A1.EXE /FILE-XML MyCustomersExtended.xml Customers/Customer CustomerID Name /FILE-JSON MyOrdersExtended.json root/value CustomerID Description
PAUSE

fc /L /N testfiles\T9_LeftSeq.xml _LeftSeq.xml
fc /L /N testfiles\T9_RightSeq.xml _RightSeq.xml
fc /L /N testfiles\T9_InnerJoin.xml _InnerJoin.xml
fc /L /N testfiles\T9_GroupJoin.xml _GroupJoin.xml
fc /L /N testfiles\T9_LeftOuterJoin.xml _LeftOuterJoin.xml
PAUSE