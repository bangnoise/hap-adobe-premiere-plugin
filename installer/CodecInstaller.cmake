cmake_minimum_required(VERSION 3.12.0 FATAL_ERROR)

# presets asset files

install(
    FILES
        ${CMAKE_CURRENT_SOURCE_DIR}/asset/encoder_preset/ame-12.0/Hap\ Alpha-Only.epr
        ${CMAKE_CURRENT_SOURCE_DIR}/asset/encoder_preset/ame-12.0/Hap\ Alpha.epr
        ${CMAKE_CURRENT_SOURCE_DIR}/asset/encoder_preset/ame-12.0/Hap\ Q\ Alpha.epr
        ${CMAKE_CURRENT_SOURCE_DIR}/asset/encoder_preset/ame-12.0/Hap\ Q.epr
        ${CMAKE_CURRENT_SOURCE_DIR}/asset/encoder_preset/ame-12.0/Hap.epr
    DESTINATION
        "$<IF:$<PLATFORM_ID:Darwin>,Library/Application Support/Hap for Adobe CC/Presets,Presets>"
    COMPONENT
        Presets
)

set(CPACK_PACKAGE_NAME "HapEncoder")
set(CPACK_PACKAGE_VENDOR "HapCommunity")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "HapEncoder - Hap encoding plugin for Adobe CC 2019")
set(CPACK_PACKAGE_VERSION "1.1.0-prealpha1")
set(CPACK_PACKAGE_VERSION_MAJOR "1")
set(CPACK_PACKAGE_VERSION_MINOR "1")
set(CPACK_PACKAGE_VERSION_PATCH "0-alpha1")
set(CPACK_PACKAGE_INSTALL_DIRECTORY "HapEncoderPlugin")
set(CPACK_RESOURCE_FILE_LICENSE ${CMAKE_CURRENT_LIST_DIR}/../license.txt)
set(CPACK_RESOURCE_FILE_README ${CMAKE_CURRENT_LIST_DIR}/ReadMe.txt)

set(CPACK_COMPONENTS_ALL presets plugin)

# NSIS specific settings
set(CPACK_NSIS_URL_INFO_ABOUT "https://hap.video")
set(CPACK_NSIS_ENABLE_UNINSTALL_BEFORE_INSTALL ON)
set(CPACK_NSIS_PACKAGE_NAME "Hap Encoder Plugin for Adobe CC 2019")
set(CPACK_NSIS_HELP_LINK "https://github.com/disguise-one/hap-encoder-adobe-cc")
set(CPACK_NSIS_URL_INFO_ABOUT "https://github.com/disguise-one/hap-encoder-adobe-cc/tree/master/doc/user_guide/")
set(CPACK_NSIS_CONTACT "happlugin@disguise.one")

set(CPACK_NSIS_EXTRA_INSTALL_COMMANDS
  "Delete \\\"$PROGRAMFILES64\\\\Adobe\\\\Common\\\\Plug-ins\\\\7.0\\\\MediaCore\\\\CodecPluginFoundation.prm\\\""
  "\\nDelete \\\"$PROGRAMFILES64\\\\Adobe\\\\Common\\\\Plug-ins\\\\7.0\\\\MediaCore\\\\HapEncoderPlugin.prm\\\""
)

# set(bitmap_path ${CMAKE_CURRENT_LIST_DIR}/../asset/install_image.bmp)
# STRING(REPLACE "/" "\\" bitmap_path  ${bitmap_path}) 
# set(CPACK_NSIS_MUI_WELCOMEFINISHPAGE_BITMAP ${bitmap_path})

# codec specific component install paths
set(Foundation_CODEC_SPECIFIC_COMPONENTS Presets)
set(CPACK_NSIS_Presets_INSTALL_DIRECTORY "$PROFILE\\\\Documents\\\\Adobe\\\\Adobe\ Media\ Encoder\\\\13.0")

# macOS presets install script
if (APPLE)
    set(CPACK_POSTFLIGHT_PRESETS_SCRIPT ${CMAKE_CURRENT_SOURCE_DIR}/installer/postinstall)
endif (APPLE)
