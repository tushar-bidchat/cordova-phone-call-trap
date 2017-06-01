Cordova PhoneCall Trap
=======================

It is a Apache Cordova plugin to simplify handling phone call status and events in Android devices.


## Install

    $ cordova plugin add ihttps://github.com/tushar-bidchat/cordova-phone-call-trap.git


## Quick Example

    'IDLE'  = Disconnected or not connected
    'OFFHOOK' = Call is connected
    'RINGING' = Phone is ringing/ incoming call

    PhoneCallTrap.onCall();

    var phoneEventCallBack = function (state){
        console.log(state);
    }



## Supported platforms

- Android 2.3.3 or higher

## License

Cordova PhoneCall Trap is released under the [MIT License](http://www.opensource.org/licenses/MIT).
