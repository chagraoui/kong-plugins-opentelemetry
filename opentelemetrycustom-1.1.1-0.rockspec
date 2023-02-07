package = "opentelemetrycustom"

version = "1.1.1-0"

source = {
  url = "git+https://github.com/chagraoui/kong-plugins-opentelemetry",
}



local pluginName = "opentelemetrycustom"
supported_platforms = {"linux", "macosx"}


description = {
  summary = "A Kong plugin opentelemetry"
}
dependencies = {
  "lua ~> 5"
}
build = {
  type = "builtin",
  modules = {
    ["kong.plugins.opentelemetry.proto"] = "proto.lua",
    ["kong.plugins.opentelemetry.otlp"] = "otlp.lua",
    ["kong.plugins.opentelemetry.handler"] = "handler.lua",
    ["kong.plugins.opentelemetry.schema"]  = "schema.lua"
  }
}
