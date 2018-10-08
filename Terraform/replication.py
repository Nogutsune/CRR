import json

file = "output.txt"
lines = [line.rstrip('\n') for line in open(file)]


iam_source_arn = lines[1].split("=")[1].strip(" ")
destination_bucket_arn = lines[0].split("=")[1].strip(" ")
Destination_Account_ID = '648791014442'


data = {
'Role': iam_source_arn ,
'Rules': [{
  'Status': 'Enabled',
  'Prefix': '',
  'Destination': {
    'Bucket': destination_bucket_arn ,
    'Account': Destination_Account_ID ,
    'AccessControlTranslation': {
       'Owner': 'Destination'
        }
    }
  }]
}
with open('replication.json', 'w') as outfile:
    json.dump(data, outfile)