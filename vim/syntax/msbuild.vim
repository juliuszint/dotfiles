if exists("b:current_syntax")
    finish
endif

syn match msbuildFilename /^[^(]*/ nextgroup=msbuildLocation
syn match msbuildLocation /(\d*,\d*):/ contains=msbuildColumnSeperator skipwhite nextgroup=msbuildErrorLevelError,msbuildErrorLevelWarning contained
syn match msbuildErrorLevelError /error [A-Z0-9]*:/ contains=msbuildColumnSeperator skipwhite nextgroup=msbuildErrorMessage contained
syn match msbuildErrorLevelWarning /warning [A-Z0-9]*:/ contains=msbuildColumnSeperator skipwhite nextgroup=msbuildErrorMessage contained
syn match msbuildErrorMessage /.*$/ contained
syn match msbuildColumnSeperator /:/ contained
