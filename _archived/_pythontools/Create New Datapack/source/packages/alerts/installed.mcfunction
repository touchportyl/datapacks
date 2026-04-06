# notify
tellraw @a [{"text":"","color":"green","hoverEvent":{"action":"show_text","value":"Alert from $datapackDisplayName"}},{"text":" +"},{"text":" $datapackDisplayName ","color":"$datapackColor","bold":true,"hoverEvent":{"action":"show_text","value":"$datapackDescription"}},{"text":"$datapackDisplayVersion","color":"gray"},{"text":" > ","color":"white"},{"text":"$datapackDisplayName has been installed successfully."}]

function datapackmanager-$datapackManagerFullVersion:packages/effects/ui_jingle