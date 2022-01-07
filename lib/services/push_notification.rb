module Services
  class PushNotification
    def push
      message = {
          # 'topic': "89023", # OR token if you want to send to a specific device
          # TO IMPLEMENT : Save devise token to current user if not exists.
          'token': "ccZ8-M5TQpifZsqQe1RUvA:APA91bGq90DmbjY62m69GTX2i1_vyi7UFvY4ATY_CN0qwcex40eWrFdQHPlftS8fGJH9sBPlZMVZTUn40b__ATksGy8LTZT2mkCwrwOGfo-aLdFEpDRlJivycDDhcIPtyzTLXk2ahk59",
          'data': {
              payload: {
                  data: {
                      id: 1
                  }
              }.to_json
          },
          'notification': {
              title: "Title from api",
              body: "Body from api",
          },
          'android': {},
          'apns': {
              payload: {
                  aps: {
                      sound: "default",
                      category: "#{Time.zone.now.to_i}"
                  }
              }
          },
          'fcm_options': {
              analytics_label: 'Label'
          }
      }

      res = FCMClient.send_v1(message)

      puts 'FCMClient.send_v1', res
    end
  end
end
