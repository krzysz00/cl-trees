;; Copyright (c) 2010 Krzysztof Drewniak

;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:

;; The above copyright notice and this permission notice shall be included in
;; all copies or substantial portions of the Software.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
;; THE SOFTWARE.

(in-package :cl-trees)

(defclass meta-tree () ()
  (:documentation "The `meta-tree' class is the superclass of all trees. A method implemented on `meta-tree' MUST be supported by all subclasses of meta-tree. If this ever isn't the case, you have found a bug."))

(defclass meta-binary-tree (meta-tree)
  ((root :initform (error "Must specify something to put in the root") 
	 :initarg :root :accessor root :documentation 
"A pointer to the root of the binary tree. For convinience purposes, if you specify anything other than a `binary-node' in the `:root' initarg, a new `binary-node' will be created with the object you specify as its `data'")
   (leq-test :initform #'<= :initarg :leq-test :accessor leq-test
	     :documentation "A function of two arguments that returns T if the first argument is less than of equal to the second. Defaults to #'<=")
   (eql-test :initform #'= :initarg :eql-test :accessor eql-test
	     :documentation "A function of two arguments that returns T if the first argument is equal to the second. Defaults to #'=")
   (node-type :initform nil :reader node-type :documentation "Type of node this tree uses"))
  (:documentation "`meta-binary-tree' is the class from which all binary trees descend. In addition ti the initargs of its slots, the `meta-binary-tree' supports one additional initarg, `:elements'. :eements is a list of elements that are to e inserted into the tree, in order."))

(defclass binary-node ()
  ((data :initform nil :initarg :data :accessor data 
	 :documentation "A container for the data contained in this node.")
   (parent :initform nil :initarg :parent :accessor parent
	   :documentation "A pointer the the parent of this node.")
   (left :initform nil :initarg :left :accessor left
	 :documentation "A pointer to the left child of this node.")
   (right :initform nil :initarg :right :accessor right
	 :documentation "A pointer to the right child of this node."))
  (:documentation "This is the base class for binary tree nodes. Binary tree implementations which need to store additional information will subclass this class"))
