#--- Usage info ----------------------------------------------------------------
#  -- Change setup variables if you need.
#  -- Invoke this makefile with a well-defined 'config' macro in the
#     'os-arch-mode' format.
#  -- Don't forget to write configuration build list,
#     if you add a new config.
#  -- Have a nice day. Have some tea. Have fun!


#--- Variables setup -----------------------------------------------------------
incdirs := inc
libdirs :=
flags   := -Wall -Wextra -std=c++23 -masm=intel -m64 -c

tmp     := out/${config}/tmp
out     := out/${config}/out
bin     := out/${config}/out/bin
lib     := out/${config}/out/lib


include makefile-main




#--- Configuration build list --------------------------------------------------
ifeq '${config}' 'win-x64-dev'
$(call create-lib,libmoo.a)
endif

ifeq '${config}' 'win-x64-rel'
$(call create-lib,libmoo.a)
endif




#--- General build rules -------------------------------------------------------
${tmp}/%.o: src/%.cc
	$(call make-spot,$@)
	clang++ -o $(call path,$@) $(call path,$^) ${flags}

${tmp}/%.o: res/%.rc
	$(call make-spot,$@)
	windres -o $(call path,$@) $(call path,$^)