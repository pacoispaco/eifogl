####################################################################
# Description:	Python module for building ISE Eiffel systems
# Author:	Paul Cohen
# Copyright:	Copyright (c) 2001 Paul Cohen
# Date:		$Date: 2001/11/01 20:15:56 $
# Revision:	$Revision: 1.2 $
####################################################################

import os
import os.path
import tempfile
import string
import time

####################################################################

class EiffelSystemBuilder:
	"Builds Eiffel systems based on ISE Ace files"

### Initialization features 

	def __init__(self, ace_file, eiffel_compiler):
		"Create a new EiffelSystemBuilder using the given Ace file and Eiffel compiler."
		assert ace_file != None, "Precondition: ace_file != None"
		assert os.path.exists (ace_file), "Precondition: os.path.exists (ace_file)"
		assert eiffel_compiler != None, "Precondition: eiffel_compiler != None"
		assert eiffel_compiler == "ec" or eiffel_compiler == "es4", "Precondition: eiffel_compiler == \"ec\" or eiffel_compiler == \"es4\""
		
		# Initialize private attributes
		self.__ace_file = ace_file
		self.__build_dir = None
		self.__eiffel_compiler = eiffel_compiler
		self.__system_name = None
		self.__system_is_executable = None
		self.__system_is_dynamic_library = None
		self.__e_finalization_successful = None
		self.__e_finalization_time = 0
		self.__e_finalization_message = None
		self.__e_finalization_output = None
		self.__e_freezing_successful = None
		self.__e_freezing_time = 0
		self.__e_freezing_message = None
		self.__e_freezing_output = None
		self.__c_finalization_successful = None
		self.__c_finalization_time = 0
		self.__c_finalization_message = None
		self.__c_finalization_output = None
		self.__c_freezing_successful = None
		self.__c_freezing_time = 0
		self.__c_freezing_message = None
		self.__c_freezing_output = None
		self.__binary_size = None
		self.__binary_name = None

		self.parse_ace_file ()

		
### Status report (General information) 

	def ace_file (self):
		"ACE file"
		return (self.__ace_file)


	def build_dir (self):
		"Build directory"
		return (self.__build_dir)
	
	
	def eiffel_compiler (self):
		"Eiffel compiler"
		return (self.__eiffel_compiler)

		
	def eiffel_compiler_found (self):
		"Can the Eiffel compiler be found, i.e invoked?"
	        i = string.find (self.eiffel_compiler_version (), "is not recognized as an internal or external command")
		if i == -1:
		        return (1)
		else:
			return (0)
		

	def eiffel_compiler_version (self):
		"Returns the version of Eiffel compiler being used"
		command = self.eiffel_compiler () + " -version"
		result, exec_time = self.system_call (command)
		return (string.strip (result [0]))

	
	def system_name (self):
		"Returns the system name from the Ace file"
		return (self.__system_name)
	

	def system_is_executable (self):
		"Is the system to be compiled an executable, ie. a .exe file?"
		return (self.__system_is_executable)
		

	def system_is_dynamic_library (self):
		"Is the system to be compiled a dynamic library, ie. a .dll file?"
		return (self.__system_is_dynamic_library)
		

	def clusters (self):
		"Returns a list of all clusters in the Ace file in the form of full paths"
		print "\"clusters\" not implemented yet!"
		
		
	def external_includes (self):
		"Returns a list of all external includes in the Ace file in the form of full paths"
		print "\"external_includes\" not implemented yet!"

		
	def external_objects (self):
		"Returns a list of all external objects in the Ace file in the form of full paths"
		print "\"external_objects\" not implemented yet!"
		

### Status report (Build/compile information)

	def e_finalization_successful (self):
		"Was the last Eiffel finalization successful?"
		return (self.__e_finalization_successful)


	def e_finalization_time (self):
		"Time to complete last Eiffel finalization, in seconds"
		return (self.__e_finalization_time)
	

	def e_finalization_message (self):
		"Message for last Eiffel finalization"
		return (self.__e_finalization_message)

	
	def e_finalization_output (self):
		"Output from Eiffel compiler for last Eiffel finailization"
		return (self.__e_finalization_output)

	
	def e_freezing_successful (self):
		"Was the last Eiffel freezing successful?"
		return (self.__e_freezing_successful)
	
	
	def e_freezing_time (self):
		"Time to complete last Eiffel freezing, in seconds"
		return (self.__e_freezing_time)


	def e_freezing_message (self):
		"Message for last Eiffel freezing"
		return (self.__e_freezing_message)


	def e_freezing_output (self):
		"Output from Eiffel compiler for last Eiffel freezing"
		return (self.__e_freezing_output)
	

	def c_finalization_successful (self):
		"Was the C compilation of a finalized Eiffel system successful?"
		return (self.__c_finalization_successful)


	def c_finalization_time (self):
		"Time to complete last C compilation of a finalized Eiffel system, in seconds"
		return (self.__c_finalization_time)


	def c_finalization_message (self):
		"Message for last C compilation of a finalized Eiffel system"
		return (self.__c_finalization_message)


	def c_finalization_output (self):
		"Output from C compiler for last C compilation of a finalized Eiffel system"
		return (self.__c_finalization_output)
	
			
	def c_freezing_successful (self):
		"Was the last C compilation of a frozen Eiffel system successful?"
		return (self.__c_freezing_successful)


	def c_freezing_time (self):
		"Time to complete last C compilation of a frozen Eiffel system, in seconds"
		return (self.__c_freezing_time)


	def c_freezing_message (self):
		"Message for last C compilation of a frozen Eiffel system"
		return (self.__c_freezing_message)


	def c_freezing_output (self):
		"Output from C compiler for last C compilation of a frozen Eiffel system"
		return (self.__c_freezing_output)
	

	def binary_size (self):
		"Size of binary generated from last successful compilation. Returns None if no binary was generated. Can be either an .exe or .dll file!"
		return (self.__binary_size)


	def binary_name (self):
		"Name of binary generated from last successful compilation. Returns None if no binary was generated. Can be either an .exe or .dll file!"
		return (self.__binary_name)

	
### Basic operations (Build/compile)

	def e_finalize (self):
		"Finalize the Eiffel system"
		self.e_compile (1)


	def e_freeze (self):
		"Freeze the Eiffel system"
		self.e_compile (0)

		
	def e_compile (self, finalize):
		"Compile the Eiffel system. If finalize then finalize, otherwise freeze."
		assert self.eiffel_compiler_found (), "Precondition: self.eiffel_compiler_found ()"

		# Save the current working directory
		org_dir = os.getcwd()
		os.chdir (self.build_dir ())  

		msg = []
		
		if finalize:
                        msg.append ("\nPreparing to finalize Eiffel system \"" + self.system_name () + "\" ...")
		else:
			msg.append ("\nPreparing to freeze Eiffel system \"" + self.system_name () + "\" ...")
		msg.append ("  Build directory: " + self.build_dir ())
		msg.append ("  Ace file: " + self.ace_file ())

		# Remove existing project if any
		if os.path.exists (self.build_dir () + "\\EIFGEN"):
			msg.append ("Removing existing EIFGEN ...")
			command = "rmdir EIFGEN /s /q"    
			os.system (command)
			msg.append ("  EIFGEN removed")

		# Start compiling the Eiffel code
		msg.append ("Starting Eiffel compilation (" + self.eiffel_compiler_version () + ") ...")
		if finalize:
			command = self.eiffel_compiler () + " -batch -ace "+ self.ace_file () + " -finalize"
		else:
			command = self.eiffel_compiler () + " -batch -ace "+ self.ace_file () + " -freeze"
		msg.append ("  " + command)
		output_lines, exec_time = self.system_call (command)
		msg.append ("  Time to compile: " + str (exec_time) + " seconds.")
		if finalize:
			self.__e_finalization_output = output_lines
			self.__e_finalization_time = exec_time
		else:
			self.__e_freezing_output = output_lines
			self.__e_freezing_time = exec_time
		
		if self.eiffel_compilation_completed (output_lines):
			msg.append ("Eiffel compilation successful!")
			if finalize:
				self.__e_finalization_successful = 1
			else:
				self.__e_freezing_successful = 1
		else:
			msg.append ("Eiffel compilation failed.")
			if finalize:
				self.__e_finalization_successful = None
			else:
				self.__e_freezing_successful = None

		if finalize:
			self.__e_finalization_message = msg
		else:
			self.__e_freezing_message = msg
		
		# Restore the current directory
		os.chdir (org_dir)  

		
	def c_finalize (self):
		"Compile the C code for a finalized Eiffel system"
		self.c_compile (1)

		
	def c_freeze (self):
		"Compile the C code for a frozen Eiffel system"
		self.c_compile (0)


	def c_compile (self, finalize):
		"Compile C code for an Eiffel system. If finalize compile a finalized system, otherwise a frozen system."
		assert self.eiffel_compiler_found (), "Precondition: self.eiffel_compiler_found ()"
		assert (finalize and self.e_finalization_successful ()) or (not finalize and self.e_freezing_successful), "Precondition: (finalize and self.e_finalization_successful ()) or (not finalize and self.e_freezing_successful)"
		
		# Save the current working directory
		org_dir = os.getcwd ()
		if finalize:
			os.chdir (self.build_dir () + "\\EIFGEN\\F_code")  
		else:
			os.chdir (self.build_dir () + "\\EIFGEN\\W_code")  

		msg = []

		# Start compiling the C code
		msg.append ("\nStarting C compilation ...")
		command = "finish_freezing -silent"
		output_lines, exec_time = self.system_call (command)
		msg.append ("  Time to compile: " + str (exec_time) + " seconds.")
		if finalize:
			self.__c_finalization_output = output_lines
			self.__c_finalization_time = exec_time
		else:
			self.__c_freezing_output = output_lines
			self.__c_freezing_time = exec_time
			
#		if self.c_compilation_completed (output_lines):
		if self.c_compilation_completed2 (finalize):
			msg.append ("C compilation and linking successful!")
			if finalize:
				self.__c_finalization_successful = 1
			else:
				self.__c_freezing_successful = 1
			path = os.getcwd () + "\\" + self.binary_name ()
			if os.path.exists (path):
				self.__binary_size = os.path.getsize (path)
		else:
		        msg.append ("C compilation or linking failed.")
			if finalize:
				self.__c_finalization_successful = None
			else:
				self.__c_freezing_successful = None

		if finalize:
			self.__c_finalization_message = msg
		else:
			self.__c_freezing_message = msg
			
		# Restore the current directory
		os.chdir (org_dir)  
		

	def finalize (self):
		"Finalize the Eiffel system."	
		assert self.eiffel_compiler_found (), "Precondition: self.eiffel_compiler_found ()"
		
		# Start Eiffel finalization
		self.e_compile (1)
		
		if self.e_compilation_successful:
			# Start C compilation
			self.c_compile (1)
			

	def freeze (self):
		"Freeze the Eiffel system."
		assert self.eiffel_compiler_found (), "Precondition: self.eiffel_compiler_found ()"

		# Start Eiffel freezing
		self.e_compile (0)
		
		if self.e_compilation_successful:
			# Start C compilation
			self.c_compile (0)


### Implementation

	def parse_ace_file (self):
		"Parse the given Ace file. Assumes decent Ace file!"
		assert self.ace_file () != None, "Precondition: self.ace_file () != None"
		assert os.path.exists (self.ace_file ()), "Precondition: os.path.exists (self.ace_file ())"

		last_backslash_index = string.rindex (self.ace_file (), "\\")
		self.__build_dir = self.ace_file () [0: last_backslash_index]
		
		f = open (self.__ace_file)
		lines = f.readlines ()
		parsing_system_production = None
		system_name = ""
		i = 0
		while i < len (lines):
			line = lines[i]
			words = string.split (line)
			if len (words) > 0:
				if words[0] == "system":
					parsing_system_production = 1
					if len (words) > 1:
						system_name = words[1]
						break
				elif parsing_system_production and len (words) > 0:
					system_name = words[0]
					break
			words = string.split (line, "(")
			if len (words) > 0:
				print words[0]
				if words[0] == "shared_library_definition":
					self.__system_is_dynamic_library = 1
				else:
					self.__system_is_executable = 1
			i = i + 1
		f.close ()
		self.__system_name = system_name
		binary_name = self.system_name ()
		if self.system_is_executable:
			self.__binary_name = binary_name + ".exe"
		else:
			self.__binary_name = binary_name + ".dll"


	def eiffel_compilation_completed (self, compiler_output):
		"Was the Eiffel compilation successful (Based on the contents of compiler_output)?"
		assert compiler_output != None, "Precondition: compiler_output != None"

		if len (compiler_output) > 0:
			line = compiler_output[len (compiler_output) - 3]
			line = string.strip (line)
			if line == "System recompiled.":
				return (1)
			else:
				return (None)
		else:
			return (None)
		

	def c_compilation_completed (self, compiler_output):
		"Was the C compilation successful (Based on the contents of compiler_output)?"
		assert compiler_output != None, "Precondition: compiler_output != None"

		if len (compiler_output) > 0:
			line = compiler_output[len (compiler_output) - 1]
			line = string.strip (line)
			if line == "echo done > completed.eif":
				return (1)
			else:
				return (None)
		else:
			return (None)


	def c_compilation_completed2 (self, finalize):
		"Was the C compilation successful (Based on the existence of a .exe or .dll file)?"

		if finalize:
			exe_name = self.build_dir () + "\\EIFGEN\\F_code\\" + self.system_name ()
			if self.system_is_executable ():
				exe_name = exe_name + ".exe"
			else:
				exe_name = exe_name + ".dll"
		else:
			exe_name = self.build_dir () + "\\EIFGEN\\W_code\\" + self.system_name ()
			if self.system_is_dynamic_library ():
				exe_name = exe_name + ".exe"
			else:
				exe_name = exe_name + ".dll"
		return (os.path.exists (exe_name))
		
### Utilities

	def system_call (self, command):
		"Call os.system (command) and return a tuple containing a) the resulting output as a list of strings. This output consists of intermingled stdout and stderr, and b) the time it took to execute the command"
		assert command != None, "Precondition: command != None"

		output_lines = []
		tmpfile = tempfile.mktemp (".tmp")
		cmd = command + " > " + tmpfile + " 2>&1"
		start_time = time.clock ()
		os.system (cmd)
		stop_time = time.clock()
		try:
		        f = open (tmpfile)
			output_lines = f.readlines ()
			f.close ()
			os.remove (tmpfile)
		except IOError, e:
		        print "    ... Uh-oh. Can't open temporary output file from system call."
		return (output_lines, stop_time - start_time)

		
	def formatted_time (self, seconds):
		"Return a formatted time string: \"H hours, M minutes, S seconds\""
		mins = div (seconds, 60)
		secs = mod (seconds, 60)
		hrs = div (mins, 60)
		mins = mod (mins, 60)
		if hrs > 0:
			result = hrs + " hours, "
		if hrs > 0 or mins > 0:
			result = result + mins + " minutes, "
	       	if hrs > 0 or mins > 0 or seconds > 0:
			result = result + secs + " seconds"


####################################################################

class EbuildTarget:
	"Description of an ebuild target"

### Initialization features 

	def __init__(self, name, compiler, ace_file, build_type):
		"Create an ebuild target with the given name"
		assert name != None, "Precondition: name != None"
		assert compiler != None, "Precondition: compiler != None"
		assert ace_file != None, "Precondition: ace_file != None"
		assert build_type != None, "Precondition: build_type != None"

		self.__name = name
		self.__compiler = compiler
		self.__ace_file = ace_file
		self.__build_type = build_type

		
### Status report (General information) 

	def name (self):
		"The name of the target"
		return (self.__name)


	def compiler (self):
		"The Eiffel compiler to use"
		return (self.__compiler)


	def ace_file (self):
		"The Ace file to use for building the target"
		return (self.__ace_file)


	def build_type (self):
		"The type of build (finalization or freezing)"
		return (self.__build_type)
		

	def __str__ (self):
		"Printable representation"
		return "\nTarget name: " + self.name () + "\nCompiler: " + self.compiler () + "\nAce file: " + self.ace_file () + "\nBuild type: " + self.build_type ()


####################################################################
# Format for EbuildTargetSpecFile:
# Important note 1: statements corresponding to indivudual productions
# marked with a beginning "*" must be on separate lines!
# Important note 2: Comments are only allowed if the entire line is a
# comment.
# targetlist -> {target"," ...}
# * target -> "target" targetname build_spec
# targetname -> identifier 
# build_spec -> compiler_spec ace_file_spec build_type_spec
# * compiler_spec -> "compiler" ":" "ec" | "es4"
# * ace_file_spec -> "ace_file" ":" full_path 
# * build_type_spec -> "build_type" ":" "finalize | "freeze"
# full_path -> "$" env_var "\" path | path
		
class EbuildTargetSpecFile:
	"File containing ebuild target specifications"

### Initialization features 

	def __init__(self, file_name):
		"Create a ebuild target specification file object from the file file_name"
		assert file_name != None, "Precondition: file_name != None"
		assert os.path.exists (file_name), "Precondition: os.path.exists (file_name)"

		self.__file_name = file_name
		self.__targets = []
		self.__is_valid = None

		self.parse_file ()

		
### Status report (General information) 

	def file_name (self):
		"File name"
		return (self.__file_name)


	def targets (self):
		"List of EbuildTargets"
		return (self.__targets)
		
	def is_valid (self):
		"Is this a valid ebuild target specification file?"
		return (self.__is_valid)

	
## Implementation

	## Parsing states
	def Parsing_new_target (self):
		return (1)
	def Parsing_compiler_spec (self):
		return (2)
	def Parsing_ace_file_spec (self):
		return (3)
	def Parsing_build_type_spec (self):
		return (4)
	
	def parse_file (self):
		"Parse the file" 
		f = open (self.__file_name)
		lines = f.readlines ()

		# Initialization
		input = []
		err_msg = None
		i = 1
		target_name = ""
		compiler = ""
		ace_file = ""
		build_type = ""
		parsing_state = self.Parsing_new_target ()
		
		for line in lines:
			# Skip all comment lines and blank lines
			stripped_line = string.strip (line)
			if len (stripped_line) > 0 and stripped_line[0:2] != "--":
				if parsing_state == self.Parsing_new_target ():
					words = string.split (stripped_line)
					if len (words) != 2:
						err_msg = "Error: Invalid number of tokens on line " + str (i) + "."
						break
					else:
						if words[0] != "target":
							err_msg = "Error: Expected keyword \"target\" is not first token on line " + str (i) + "."
							break
						else:
							target_name = words[1]
							parsing_state = self.Parsing_compiler_spec ()
				elif parsing_state == self.Parsing_compiler_spec ():
					words = string.split (stripped_line, ": ")
					if len (words) != 2:
						err_msg = "Error: Invalid number of tokens on line " + str (i)
						break
					else:
						if words[0] != "compiler":
							err_msg = "Error: Expected keyword \"compiler\" is not first token on line " + str (i) + "."
							break
						else:
							compiler = string.strip (words[1])
							if not (compiler == "es4" or compiler == "ec"):
								err_msg = "Error: Invalid compiler selection on line " + str (i) + ". Must be one of \"es4\", \"ec\"."
								break
							else:
								parsing_state = self.Parsing_ace_file_spec ()
				elif parsing_state == self.Parsing_ace_file_spec ():
					words = string.split (stripped_line, ": ")
					if len (words) != 2:
						err_msg = "Error: Invalid number of tokens on line " + str (i)
						break
					else:
						if words[0] != "ace_file":
							err_msg = "Error: Expected keyword \"ace_file\" is not first token on line " + str (i) + "."
							break
						else:
							path = string.strip (words[1])
							ace_file = ""
							# Loop over the individual items in the path and
							# see if any is declared as an environment variable,
							# for example: "$MYDIR".
							items = string.split (path, "\\")
							for item in items:
								if item[0] == "$":
									var = os.environ[item[1:len(item)]]
									if ace_file == "":
										ace_file = ace_file + var
									else:
										ace_file = ace_file + "\\" + var
								else:
								        if ace_file == "":
									        ace_file = ace_file + item
									else:
									        ace_file = ace_file + "\\" + item
							if not os.path.exists (ace_file):
								err_msg = "Error: Path specified on line " + str(i) + " is not a valid path. (" + ace_file + ")"
								break
							else:
								parsing_state = self.Parsing_build_type_spec ()
				elif parsing_state == self.Parsing_build_type_spec ():
					words = string.split (stripped_line, ": ")
					if len (words) != 2:
						err_msg = "Error: Invalid number of tokens on line " + str (i)
						break
					else:
						if words[0] != "build_type":
							err_msg = "Error: Expected keyword \"build_type\" is not first token on line " + str (i)
							break
						else:
							build_type = string.strip (words[1])
							if not (build_type == "finalize" or build_type == "freeze"):
								err_msg = "Error: Invalid build type on line " + str (i) + ". Must be one of \"finalize\", \"freeze\"."
								break
							else:
								parsing_state = self.Parsing_new_target ()
				if parsing_state == self.Parsing_new_target ():
				        # Create new target object and append it to the list of targets
					target = EbuildTarget (target_name, compiler, ace_file, build_type)
					self.__targets.append (target)
					# Reset the target attributes
					target_name = ""
					compiler = ""
					ace_file = ""
					build_type = ""
			i = i + 1
		if err_msg == None:
		        self.__is_valid = 1
		else:
			print err_msg
			self.__is_valid = None


####################################################################
		
class ISEOutput:
	"Output from the ISE Eiffel compiler"

### Initialization features 

	def __init__(self, output):
		"Create an ISE output object based on ouput, where output consists of a list of output lines from an Eiffel compilation"
		assert output != None, "Precondition: output != None"

		self.__output = output
		self.__compilation_successful = None
		self.__degree = None
		self.__error_messages = []
		self.__number_of_errors = 0
		
		self.parse_output ()


### Status report (General information) 


	def output (self):
		"Full output as a list of lines"
		return (self.__output)

	
	def compilation_successful (self):
		"Was the Eiffel compilation successful?"
		return (Self.__compilation_successful)


	def compilation_failure_degree (self):
		"Degree at which Eiffel compilation failed"
		return (self.__degree)


	def error_messages (self):
		"List of all error messages. Every error message is a list of strings (output lines)"
		return (self.__error_messages)

	
### Implementation

	def parse_output (self):
		"Parse the ouput"
		parsing_error = None
		output = self.output ()
		self.__degree = "-"
		for line in output:
			stripped_line = string.strip (line)
			if parsing_error:
				error.append (stripped_line)
				if string.find (stripped_line, "----------") != -1:
					self.__error_messages.append (error)
					error = []
					error.append (stripped_line)
			elif string.find (stripped_line, "----------") != -1:
				# Error separator encountered!
				parsing_error = 1
				error = []
				error.append (stripped_line)
			else:
				words = string.split (stripped_line)
				for w in words:
					stripped_w = string.strip (w)
					if stripped_w == "Degree":
						self.__degree = words[words.index(w) + 1]

			
##########################################################################
# Example of a main feature for building a set of targets
		
def start_building (ebuild_file):
	"Start building the targets specified in ebuild_file"
	assert ebuild_file != None, "Precondition: ebuild_file != None"
	assert os.path.exists (ebuild_file), "Precondition: os.path.exists (ebuild_file)"
	
	etsfile = EbuildTargetSpecFile (ebuild_file)
	print "\n" + "*" * 80
	msg = "\n" + "*" * 80
	msg = "\nBuild summary for all targets:\n"
	if etsfile.is_valid ():
		targets = etsfile.targets ()
		print "Starting to build targets in \"" + ebuild_file + "\""
		print "Number of targets to build: " + str (len (targets)) 
		for t in targets:
			print "\nBuilding target \"" + t.name () + "\""
			esb = EiffelSystemBuilder (t.ace_file (), t.compiler ())
			msg = msg + "\nTarget " + t.name () + " (System name: \"" + esb.system_name () + "\").\n"
			msg = msg + "Ace file: " + t.ace_file () + "\n"
			print "Eiffel compiler: " + esb.eiffel_compiler_version ()
			if t.build_type () == "finalize":
				esb.e_finalize ()
				output_lines = esb.e_finalization_message ()
				for line in output_lines:
					print line
				if esb.e_finalization_successful ():
					esb.c_finalize ()
					output_lines = esb.c_finalization_message ()
					for line in output_lines:
						print line
					if not esb.c_finalization_successful ():
						print "C compilation failed."
						msg = msg + "C compilation failed."
						output = esb.c_finalization_output ()
						for line in output:
							print line
					else:
						msg = msg + "Finalization successful. Compile time (Eiffel + C): "
						msg = msg + str (esb.e_finalization_time () + esb.c_finalization_time ())
						msg = msg + " seconds.\n"
						msg = msg + "Size of binary \"" + esb.binary_name () + "\": "
						msg = msg + str (esb.binary_size ()) + " bytes." 
				else:
					print esb.e_finalization_output
					output = ISEOutput (esb.e_finalization_output ())
					print "Failed at degree: " + output.compilation_failure_degree ()
					print "Number of errors: " + str (len (output.error_messages ()))
					print "First error: "
					error = output.error_messages () [0]
					for line in error:
						print line
					msg = msg + "Eiffel finalization failed at degree " + output.compilation_failure_degree ()
					print " (" + str (len (output.error_messages ())) + " errors)."
			else:
				esb.e_freeze ()
				output_lines = esb.e_freeze_message ()
				for line in output_lines:
					print line
				if esb.e_freeze_successful ():
					esb.c_freeze ()
					output_lines = esb.c_freeze_message ()
					for line in output_lines:
						print line
					if not esb.c_freeze_successful ():
						print "C compilation failed."
						msg = msg + "C compilation failed."
						output = esb.c_freeze_output ()
						for line in output:
							print line
					else:
						msg = msg + "Freezing successful. Compile time (Eiffel + C): "
						msg = msg + str (esb.e_freezing_time () + esb.c_freezing_time ())
						msg = msg + " seconds.\n"
						msg = msg + "Size of binary \"" + esb.binary_name () + "\": "
						msg = msg + str (esb.binary_size ()) + " bytes." 
				else:
					output = ISEOutput (esb.e_freeze_output ())
					print "Failed at degree: " + output.compilation_failure_degree ()
					print "Number of errors: " + str (len (output.error_messages ()))
					print "First error: "
					error = output.error_messages () [0]
					for line in error:
						print line
					msg = msg + "Eiffel freezing failed at degree " + output.compilation_failure_degree ()
					print " (" + str (len (output.error_messages ())) + " errors)."
			msg = msg + "\n"
	else:
	        print "Invalid ebuild target specification file"

	print "\n" + "*" * 80
	print msg


