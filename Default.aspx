<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html lang='en'>
<head>
    <meta charset='utf-8' />
    <title>访问Geoserver发布的地图</title>
    <script type='text/javascript' src='OpenLayers.js'></script>
    <script type='text/javascript'>
        var map;
        var layerstr = '<%=laysers%>';
        function init() {
            //定义地图边界
            var bounds = new OpenLayers.Bounds(145.19754, -43.423512,
             148.27298000000002, -40.852802);
            var options = {
                projection: "EPSG:4326",
                center: new OpenLayers.LonLat(146.65924, -42.13806),
            };
            map = new OpenLayers.Map('map_element', options);

            var baselayer = new OpenLayers.Layer.WMS("OpenLayers base",
               //geoserver所在服务器地址
               "http://localhost:8080/geoserver/topp/wms?service=WMS",
               {
                   layers: layerstr//"topp:tasmania_state_boundaries,topp:tasmania_roads,topp:tasmania_cities"
               });
            //添加wms图层


            map.addLayer(baselayer);

            //添加control空间
            map.addControl(new OpenLayers.Control.LayerSwitcher());
            map.addControl(new OpenLayers.Control.MousePosition());
            map.addControl(new OpenLayers.Control.ScaleLine());
            map.addControl(new OpenLayers.Control.Scale);

            map.zoomToMaxExtent(bounds);
        }


    </script>
</head>
<body onload='init();'>
    <div style="position: absolute; top: 50px; left: 80px; width: 300px; height: 100px;">
        <div id='map_element' style='width:1200px;height:500px;'></div>
        </div>
</body>
</html>
