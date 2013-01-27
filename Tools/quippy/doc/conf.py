# -*- coding: utf-8 -*-
# HQ XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
# HQ X
# HQ X   quippy: Python interface to QUIP atomistic simulation library
# HQ X
# HQ X   Copyright James Kermode 2010
# HQ X
# HQ X   These portions of the source code are released under the GNU General
# HQ X   Public License, version 2, http://www.gnu.org/copyleft/gpl.html
# HQ X
# HQ X   If you would like to license the source code under different terms,
# HQ X   please contact James Kermode, james.kermode@gmail.com
# HQ X
# HQ X   When using this software, please cite the following reference:
# HQ X
# HQ X   http://www.jrkermode.co.uk/quippy
# HQ X
# HQ XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

#
# quippy documentation build configuration file, created by
# sphinx-quickstart on Wed Sep  2 14:17:01 2009.
#
# This file is execfile()d with the current directory set to its containing dir.
#
# Note that not all possible configuration values are present in this
# autogenerated file.
#
# All configuration values have a default; values that are commented out
# serve to show the default.

import sys, os

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.

sys.path.append(os.path.abspath('..'))
sys.path.append(os.path.abspath('../quippy'))

# -- General configuration -----------------------------------------------------

# Add any Sphinx extension module names here, as strings. They can be extensions
# coming with Sphinx (named 'sphinx.ext.*') or your custom ones.
extensions = ['sphinx.ext.autodoc', 'sphinx.ext.doctest', 'sphinx.ext.pngmath',
              'sphinx.ext.autosummary', 'sphinx.ext.intersphinx',
              'sphinx.ext.viewcode', 'numpydoc']

# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

# The suffix of source filenames.
source_suffix = '.rst'

# The encoding of source files.
#source_encoding = 'utf-8'

# The master toctree document.
master_doc = 'index'

# General information about the project.
project = u'quippy'
copyright = u'2008-2013, James Kermode'

# The version info for the project you're documenting, acts as replacement for
# |version| and |release|, also used in various other places throughout the
# built documents.
#
# The short X.Y version.
import os
version=os.popen('svnversion -n ..').read()
# The full version, including alpha/beta/rc tags.
release = version

# The language for content autogenerated by Sphinx. Refer to documentation
# for a list of supported languages.
#language = None

# There are two options for replacing |today|: either, you set today to some
# non-false value, then it is used:
#today = ''
# Else, today_fmt is used as the format for a strftime call.
#today_fmt = '%B %d, %Y'

# List of documents that shouldn't be included in the build.
#unused_docs = []

# List of directories, relative to source directory, that shouldn't be searched
# for source files.
exclude_trees = ['_build']

# The reST default role (used for this markup: `text`) to use for all documents.
#default_role = None

# If true, '()' will be appended to :func: etc. cross-reference text.
#add_function_parentheses = True

# If true, the current module name will be prepended to all description
# unit titles (such as .. function::).
#add_module_names = True

# If true, sectionauthor and moduleauthor directives will be shown in the
# output. They are ignored by default.
#show_authors = False

# The name of the Pygments (syntax highlighting) style to use.
pygments_style = 'sphinx'

# A list of ignored prefixes for module index sorting.
modindex_common_prefix = ['quippy.']


# -- Options for HTML output ---------------------------------------------------

# The theme to use for HTML and HTML Help pages.  Major themes that come with
# Sphinx are currently 'default' and 'sphinxdoc'.
html_theme = 'default'

# Theme options are theme-specific and customize the look and feel of a theme
# further.  For a list of options available for each theme, see the
# documentation.
#html_theme_options = {}

# Add any paths that contain custom themes here, relative to this directory.
#html_theme_path = []

# The name for this set of Sphinx documents.  If None, it defaults to
# "<project> v<release> documentation".
#html_title = None

# A shorter title for the navigation bar.  Default is the same as html_title.
#html_short_title = None

# The name of an image file (relative to this directory) to place at the top
# of the sidebar.
#html_logo = None

# The name of an image file (within the static path) to use as favicon of the
# docs.  This file should be a Windows icon file (.ico) being 16x16 or 32x32
# pixels large.
#html_favicon = None

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ['_static']

# If not '', a 'Last updated on:' timestamp is inserted at every page bottom,
# using the given strftime format.
#html_last_updated_fmt = '%b %d, %Y'

# If true, SmartyPants will be used to convert quotes and dashes to
# typographically correct entities.
#html_use_smartypants = True

# Custom sidebar templates, maps document names to template names.
#html_sidebars = {}

# Additional templates that should be rendered to pages, maps page names to
# template names.
#html_additional_pages = {}

# If false, no module index is generated.
#html_use_modindex = True

# If false, no index is generated.
#html_use_index = True

# If true, the index is split into individual pages for each letter.
#html_split_index = False

# If true, links to the reST sources are added to the pages.
#html_show_sourcelink = True

# If true, an OpenSearch description file will be output, and all pages will
# contain a <link> tag referring to it.  The value of this option must be the
# base URL from which the finished HTML is served.
#html_use_opensearch = ''

# If nonempty, this is the file name suffix for HTML files (e.g. ".xhtml").
#html_file_suffix = ''

# Output file base name for HTML help builder.
htmlhelp_basename = 'quippydoc'


# -- Options for LaTeX output --------------------------------------------------

# The paper size ('letter' or 'a4').
#latex_paper_size = 'letter'

# The font size ('10pt', '11pt' or '12pt').
#latex_font_size = '10pt'

# Grouping the document tree into LaTeX files. List of tuples
# (source start file, target name, title, author, documentclass [howto/manual]).
latex_documents = [
  ('index', 'quippy.tex', u'quippy Documentation',
   u'James Kermode', 'manual'),
]

# The name of an image file (relative to this directory) to place at the top of
# the title page.
#latex_logo = None

# For "manual" documents, if this is true, then toplevel headings are parts,
# not chapters.
#latex_use_parts = False

# Additional stuff for the LaTeX preamble.
#latex_preamble = ''

# Documents to append as an appendix to all manuals.
#latex_appendices = []

# If false, no module index is generated.
#latex_use_modindex = True


intersphinx_mapping = {'python': ('http://docs.python.org/2.7', None),
                       'ase': ('https://wiki.fysik.dtu.dk/ase/', None)}


from quippy.oo_fortran import FortranDerivedType, FortranDerivedTypes

import re

classnames = [v.__name__ for v in FortranDerivedTypes.values()]
classname_re = re.compile('(^|\s+)((``)?)('+'|'.join([v.__name__ for v in FortranDerivedTypes.values()])+r')\2(?=[\s\W]+)')
method_or_attr_re = re.compile('(^|\s+)((``)?)('+'|'.join([v.__name__+'\.([a-zA-Z][a-zA-Z0-9_]*)' for v in FortranDerivedTypes.values()])+r')\2(?=[\s\W]+)')

doc_subs = [(classname_re, r'\1:class:`~.\4`'),
            (method_or_attr_re, r'\1:meth:`.\4`')]

def process_docstring(app, what, name, obj, options, lines):
    pass

def _process_docstring_regexp(app, what, name, obj, options, lines):
    in_block = False
    indent = 0
    for i, line in enumerate(lines):
        #print in_block, line, indent,  len(line) - len(line.lstrip()) <= indent
        if not in_block:
            if line.endswith('::'):
                in_block = True
                indent = len(line) - len(line.lstrip())
                continue
        
            for r, s in doc_subs:
                line = r.sub(s, line)
            lines[i] = line
        else:
            if not len(line) - len(line.lstrip()) <= indent:
                in_block = False
        

        
def process_signature(app, what, name, obj, options, signature, return_annotation):
    return (signature, return_annotation)


def maybe_skip_member(app, what, name, obj, skip, options):
    if hasattr(FortranDerivedType, name) and options.inherited_members:
        return True
    if not skip:
        print name
    return skip

from docutils import nodes, utils
from docutils.parsers.rst.roles import set_classes

def svn_trunk_role(role, rawtext, text, lineno, inliner, options={}, content=[]):
    if text[-1] == '>':
        i = text.index('<')
        name = text[:i - 1]
        text = text[i + 1:-1]
    else:
        name = text
    ref = 'https://src.tcm.phy.cam.ac.uk/~jrk33/viewvc/jrk33/repo/trunk/QUIP/%s?view=markup' % text
    set_classes(options)
    node = nodes.reference(rawtext, name, refuri=ref,
                           **options)
    return [node], []

def svn_release_role(role, rawtext, text, lineno, inliner, options={}, content=[]):
    if text[-1] == '>':
        i = text.index('<')
        name = text[:i - 1]
        text = text[i + 1:-1]
    else:
        name = text
    ref = 'http://src.tcm.phy.cam.ac.uk/viewvc/jrk33/repo/tags/QUIP_release/%s?view=markup' % text
    set_classes(options)
    node = nodes.reference(rawtext, name, refuri=ref,
                           **options)
    return [node], []


def mol_role(role, rawtext, text, lineno, inliner, options={}, content=[]):
    n = []
    t = ''
    while text:
        if text[0] == '_':
            n.append(nodes.Text(t))
            t = ''
            n.append(nodes.subscript(text=text[1]))
            text = text[2:]
        else:
            t += text[0]
            text = text[1:]
    n.append(nodes.Text(t))
    return n, []

def setup(app):
    app.connect('autodoc-process-docstring', process_docstring)
    app.connect('autodoc-process-signature', process_signature)
    app.connect('autodoc-skip-member', maybe_skip_member)
    app.add_role('svn', svn_release_role)
    app.add_role('svnrelease', svn_release_role)
    app.add_role('mol', mol_role)


autodoc_member_order = 'groupwise'
autoclass_content = 'both'

def add_line(self, line, source, *lineno):
    """Append one line of generated reST to the output."""
    print self.indent + line
    self.directive.result.append(self.indent + line, source, *lineno)

#import sphinx.ext.autodoc
#sphinx.ext.autodoc.Documenter.add_line = add_line

numpydoc_show_class_members = False
