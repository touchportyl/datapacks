# notify
tellraw @a [{"text":"","color":"gold","hoverEvent":{"action":"show_text","value":"Warning from $datapackDisplayName"}},{"text":" +"},{"text":" $datapackDisplayName ","color":"$datapackColor","bold":true,"hoverEvent":{"action":"show_text","value":"$datapackDescription"}},{"text":"$datapackDisplayVersion","color":"gray"},{"text":" > ","color":"white"},{"text":"This world used to run an updated version of $datapackDisplayName. Features added in future versions will not run on this version."}]

function datapackmanager-$datapackManagerFullVersion:packages/effects/ui_jingle