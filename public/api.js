(function() {
    console.log('window', window);
    if(window.apis === undefined) {
        window.apis = [];
    }
    window.apis.push(function(mapi, store) {
        var restApiStoreAdapter = new mapi.RestApiStoreAdapter('http://localhost:3001/api')
        mapi.RegisterNoun('articles', store,  restApiStoreAdapter);
    });
})();
