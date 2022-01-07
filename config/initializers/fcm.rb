FCMClient = FCM.new(
    ENV["FIREBASE_API_TOKEN"],
    Rails.root.join("firebase-service-account.#{ENV["RAILS_ENV"]}.json").to_s,
    ENV["FIREBASE_PROJECT_ID"]
)
