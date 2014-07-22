/*global google, $, MAPRAMBLE */
/*jslint browser:true, devel:true */

// 使用する変数の準備
MAPRAMBLE.markers = [];

// デバッグ情報の表示
MAPRAMBLE.debug = false;
MAPRAMBLE.console = {};
MAPRAMBLE.console.log = function (message) {
    'use strict';
    if (MAPRAMBLE.debug === true) {
        console.log(message);
    }
};

// マップを生成
MAPRAMBLE.createMap = function (initial) {
    'use strict';
    var options;

    options = {
        zoom: initial.zoom,
        center: new google.maps.LatLng(initial.lat, initial.lng),
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    this.console.log(initial);
    this.console.log(options);

    // マップの生成
    return new google.maps.Map(document.getElementById("map"), options);
};

// マーカー群を追加
MAPRAMBLE.addPlaceMarkers = function () {
    'use strict';

    var that = this;

    that.places.map(function (place) {
        that.addMarker(place);
    });
};

// 個々のマーカーを追加
MAPRAMBLE.addMarker = function (place) {
    'use strict';
    var marker, options;

    options = {
        position: new google.maps.LatLng(place.lat, place.lng),
        map: this.map,
        icon: "http://maps.google.com/mapfiles/marker.png"
    };

    marker = new google.maps.Marker(options);

    google.maps.event.addListener(marker, 'click', function () {
        return (function (id) {
            if (MAPRAMBLE.mode === 'edit') {
                $.mobile.changePage('/places/' + id + '/edit');
            } else {
                $.mobile.changePage('/places/' + id);
            }
        }(place.id));
    });

    // マーカーを配列に入れる
    this.markers.push(marker);
};

// マップの高さを画面サイズに合わせる
MAPRAMBLE.setHeight = function () {
    'use strict';
    var windowInnerHeight = $(window).innerHeight(),
        headerHeight = $("#header").height(),
        footerHeight = $("#footer").height(),
        uiContentPadding
            = parseInt($(".ui-content").css('padding-top'), 10)
            + parseInt($(".ui-content").css('padding-bottom'), 10);

    $("#map").css("height", windowInnerHeight - headerHeight - footerHeight - uiContentPadding);
};

// イベントハンドラの設定
MAPRAMBLE.setEventHandler = function () {
    'use strict';

    $(window).on('resize', function () {
        MAPRAMBLE.setHeight();
    });

    if (this.mode === 'edit') {
        google.maps.event.addListener(this.map, 'click', function (event) {
            $.mobile.changePage('/places/new?lat=' + event.latLng.lat() + '&lng=' + event.latLng.lng());
        });        
    }
};

// マップの表示範囲をマーカーに合わせる
MAPRAMBLE.fitBounds = function () {
    'use strict';
    this.map.fitBounds(this.bounds);
};

// メイン・プログラム
$(document).on('pageshow', function () {
    'use strict';
    MAPRAMBLE.setHeight();
    MAPRAMBLE.map = MAPRAMBLE.createMap({zoom: 14, lat: 40.784056, lng: 140.781172});
    MAPRAMBLE.addPlaceMarkers();
    MAPRAMBLE.fitBounds();
    MAPRAMBLE.setEventHandler();
});
