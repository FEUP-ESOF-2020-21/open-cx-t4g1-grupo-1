// The Cloud Functions for Firebase SDK to create Cloud Functions and setup triggers.
const functions = require('firebase-functions');

// The Firebase Admin SDK to access Cloud Firestore.
const admin = require('firebase-admin');
admin.initializeApp();

// Take the text parameter passed to this HTTP endpoint and insert it into
// Cloud Firestore under the path /messages/:documentId/original
exports.addMessage = functions.https.onRequest(async (req, res) => {
    // Grab the text parameter.
    const original = req.query.text;
    // Push the new message into Cloud Firestore using the Firebase Admin SDK.
    const writeResult = await admin.firestore().collection('messages').add({original: original});
    // Send back a message that we've succesfully written the message
    res.json({result: `Message with ID: ${writeResult.id} added.`});
});


// Listen for changes in all documents in the 'talks' collection
exports.editTalk = functions.firestore
    .document('talks/{talkID}')
    .onUpdate((change, context) => {
        const talk = change.after.data();
        const payload = {
            notification: {
                title: 'Talks Edited',
                body: `${talk.title} was edited`
            }
        }

        return admin.messaging().sendToTopic("Talks" ,payload)
            .then((response) => {
                console.log('Notification sent successfully:',response);
                return true;
            })
            .catch((error) => {
                console.log('Notification sent failed:',error);
                return false;
            });
    });
exports.newTalk = functions.firestore
    .document('talks/{talkID}')
    .onCreate((change, context) => {
        const talk = change.data();
        const payload = {
            notification: {
                title: 'New Talk',
                body: `${talk.title} was added to the schedule`
            }
        }

        return admin.messaging().sendToTopic("Talks" ,payload)
            .then((response) => {
                console.log('Notification sent successfully:',response);
                return true;
            })
            .catch((error) => {
                console.log('Notification sent failed:',error);
                return false;
            });
    });
exports.deleteTalk = functions.firestore
    .document('talks/{talkID}')
    .onDelete((change, context) => {
        const talk = change.data();
        const payload = {
            notification: {
                title: 'Deleted Talk',
                body: `${talk.title} was deleted from the schedule`
            }
        }

        return admin.messaging().sendToTopic("Talks" ,payload)
            .then((response) => {
                console.log('Notification sent successfully:',response);
                return true;
            })
            .catch((error) => {
                console.log('Notification sent failed:',error);
                return false;
            });
    });