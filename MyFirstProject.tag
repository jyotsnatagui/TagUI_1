https://igrowuat2.capitaland.com/security/Login.aspx?redirect=1
type //*[@id="ctl00_ContentPlaceHolder1_RadTextBoxUserName"] as dc\\it_helpdesk
type //*[@id="ctl00_ContentPlaceHolder1_RadTextBoxPassword"] as Pass1234
click //*[@id="ctl00_ContentPlaceHolder1_RadButtonLogin_input"]
if exist("Home")
   py print("Login Successful")
else
   py print("Login UnSuccessful")
echo `py_result`
dump link to links.csv
ticketCount= count('//tr[@id]')
echo `ticketCount`

for ticket_link from 1 to ticketCount-1
   
   //click '/html/body/div/form/div[10]/div[2]/div[4]/div/div/div/div[2]/div[1]/table/tbody/tr[1]/td[1]/a'
   //read ('/html/body/div/form/div[10]/div[2]/div[4]/div/div/div/div[2]/div[1]/table/tbody/tr[1]/td[1]/a/@href')[0] to found_link
   //read //tr[@id="ctl00_ContentPlaceHolder1_Dashboard1_gvPendingTask_ctl00__`ticket_link`"]/td/@href[0] to found_link
   read //html/body/div/form/div[10]/div[2]/div[4]/div/div/div/div[2]/div[1]/table/tbody/tr[`ticket_link`]/td[1]/a/@href  to found_link
   echo `found_link`
   rowLink=['https://igrowuat2.capitaland.com/'+found_link] 
   write `csv_row(rowLink)` to links.csv
   
 

  










