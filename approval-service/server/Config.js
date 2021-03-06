var Config = {
    teamNumber: '6',
    teamParam: '?teamID=6',

    TOPIC_APPROVAL_REQUEST: 'TEAM6_APPROVAL_REQUEST',



    url: {
        messagingService: (function () {
            return process.env.MESSAGING_SERVICE ? process.env.MESSAGING_SERVICE : 'localhost:2181';
        })(),

        approval: 'http://approval.vmwaredevops.appspot.com/api/v1/approvables'

    }

};

module.exports = Config;