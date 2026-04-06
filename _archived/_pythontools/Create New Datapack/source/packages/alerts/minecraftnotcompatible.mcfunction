# notify
tellraw @a [{"text":"","color":"red","hoverEvent":{"action":"show_text","value":"Error from $datapackDisplayName"}},{"text":" +"},{"text":" $datapackDisplayName ","color":"$datapackColor","bold":true,"hoverEvent":{"action":"show_text","value":"$datapackDescription"}},{"text":"$datapackDisplayVersion","color":"gray"},{"text":" > ","color":"white"},{"text":"$datapackDisplayName does not support this version of Minecraft. Disabling to prevent further unintended damage to your world."}]

function datapackmanager-$datapackManagerFullVersion:packages/effects/ui_jingle