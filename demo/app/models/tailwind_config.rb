# => ["screens",
#  "colors",
#  "spacing",
#  "backgroundColor",
#  "backgroundOpacity",
#  "backgroundPosition",
#  "backgroundSize",
#  "borderColor",
#  "borderOpacity",
#  "borderRadius",
#  "borderWidth",
#  "boxShadow",
#  "container",
#  "cursor",
#  "divideColor",
#  "divideOpacity",
#  "divideWidth",
#  "fill",
#  "flex",
#  "flexGrow",
#  "flexShrink",
#  "fontFamily",
#  "fontSize",
#  "fontWeight",
#  "height",
#  "inset",
#  "letterSpacing",
#  "lineHeight",
#  "listStyleType",
#  "margin",
#  "maxHeight",
#  "maxWidth",
#  "minHeight",
#  "minWidth",
#  "objectPosition",
#  "opacity",
#  "order",
#  "padding",
#  "placeholderColor",
#  "placeholderOpacity",
#  "space",
#  "stroke",
#  "strokeWidth",
#  "textColor",
#  "textOpacity",
#  "width",
#  "zIndex",
#  "gap",
#  "gridTemplateColumns",
#  "gridColumn",
#  "gridColumnStart",
#  "gridColumnEnd",
#  "gridTemplateRows",
#  "gridRow",
#  "gridRowStart",
#  "gridRowEnd",
#  "transformOrigin",
#  "scale",
#  "rotate",
#  "translate",
#  "skew",
#  "transitionProperty",
#  "transitionTimingFunction",
#  "transitionDuration",
#  "transitionDelay",
#  "backgroundImage",
#  "gradientColorStops",
#  "animation",
#  "keyframes"]
class TailwindConfig
  attr_accessor :theme

  DEFAULT_JSON_CONFIG_PATH = "app/javascript/src/tailwind.config.json"

  def initialize
    @theme = parse_json_config!
  end

  def colors
    theme["colors"]&.keys
  end

  def spacing
    theme["spacing"]&.keys
  end

  private

  def json_config_path
    DEFAULT_JSON_CONFIG_PATH
  end

  def parse_json_config!
    HashWithIndifferentAccess(JSON.parse!(read_config))
  end

  def read_config
    File.read(Rails.root.join(json_config_path))
  end
end
