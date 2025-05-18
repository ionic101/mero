import requests


URL: str = 'http://127.0.0.1:8080'

response = requests.post(URL + '/event/register',
                         data={
                            "name": "UNIT HACK",
                            "login": "unithack",
                            "password": "qwe123"
                            }
                        )
event_id = response.json()['event_id']

requests.post(URL + 'partner/register',
              data={
                "name": "Контур",
                "login": "kontur",
                "password": "qwe123"
                }
            )

requests.post(URL + 'partner/register',
              data={
                "name": "Naumen",
                "login": "naumen",
                "password": "qwe123"
                }
            )

response = requests.post(URL + f'/api/event/participant/create/{event_id}',
              data={
                "name": "Naumen",
                "login": "naumen",
                "password": "qwe123"
                }
            )


print(response.json()['participant_id'])
