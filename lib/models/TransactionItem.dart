

class TransactionItem{

//{id: 56, amount: 2500, type: debit, channel: OMNI105, status: 2,
// description: DEBIT Transaction  Demo  Student (demostudent@ba.com) , created_at: 2021-01-12 20:38:37}

String id;
String amount;
String type;
String channel;
String status;
String description;
String created_at;

TransactionItem.fromList(dynamic listitem){

  id='${listitem["id"]}';
  amount='${listitem["amount"]}';
  type='${listitem["type"]}';
  channel='${listitem["channel"]}';
  status='${listitem["status"]}';
  description='${listitem["description"]}';
  created_at='${listitem["created_at"]}';
}



}