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

(defgeneric lookup (item tree)
  (:method (item (tree meta-tree)) (error "Method on meta-tree. Implement now"))
  (:documentation "Return the `binary-node' containing the given `item' in its`data' slot."))

(defgeneric insert (item tree)
  (:method (item (tree meta-tree)) (error "Method on meta-tree. Implement now"))
  (:documentation "Create a new `binary-node' and insert it into the given `tree' at an appropriate place."))

(defgeneric weld (item parent &optional position)
  (:documentation 
"Create a `binary-node' containing `item' and attach it to `parent' at
`position', which can be one of :any (the default), :left , or :right.
This operation is intended for people building up binary trees
manually, and should not be used unless you know what you're doing. It
ia an error if the node cannot be attached to the specified position"))

(defgeneric delete-node (item tree)
  (:method (item (tree meta-tree)) (error "Method on meta-tree. Implement now"))
  (:documentation "Delete the node with the given `item' in its `data' slot from the tree."))

(defgeneric rebalance (tree)
  (:method ((tree meta-tree)) (warn "Method on meta-tree. Implement now"))
  (:documentation "Forces the `tree' to be rebalanced. Not all trees will support this operation."))

(defgeneric convert (tree tree-type)
  (:method ((tree meta-tree) tree-type) (warn "Method on meta-tree. Implement now"))
  (:documentation "Convert the tree `tree' to a tree of `tree-type', which must be a symbol"))

(defgeneric serialize (tree &key nodes)
  (:documentation "Traverses `tree' and returns a list containing all the elements in `tree'. If `tree' is a search tree, the elements will be in order. If `nodes' is `T, then the `binary-node's will be returned instead of the data."))

 