// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.28.1
// 	protoc        v4.24.4
// source: config.proto

package proto

import (
	protoreflect "google.golang.org/protobuf/reflect/protoreflect"
	protoimpl "google.golang.org/protobuf/runtime/protoimpl"
	reflect "reflect"
	sync "sync"
)

const (
	// Verify that this generated code is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(20 - protoimpl.MinVersion)
	// Verify that runtime/protoimpl is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(protoimpl.MaxVersion - 20)
)

type IndexSpec struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Name         string      `protobuf:"bytes,1,opt,name=name,proto3" json:"name,omitempty"`
	Paths        []*PathSpec `protobuf:"bytes,2,rep,name=paths,json=fs_paths,proto3" json:"paths,omitempty"`
	Repositories []*RepoSpec `protobuf:"bytes,3,rep,name=repositories,proto3" json:"repositories,omitempty"`
}

func (x *IndexSpec) Reset() {
	*x = IndexSpec{}
	if protoimpl.UnsafeEnabled {
		mi := &file_config_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *IndexSpec) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*IndexSpec) ProtoMessage() {}

func (x *IndexSpec) ProtoReflect() protoreflect.Message {
	mi := &file_config_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use IndexSpec.ProtoReflect.Descriptor instead.
func (*IndexSpec) Descriptor() ([]byte, []int) {
	return file_config_proto_rawDescGZIP(), []int{0}
}

func (x *IndexSpec) GetName() string {
	if x != nil {
		return x.Name
	}
	return ""
}

func (x *IndexSpec) GetPaths() []*PathSpec {
	if x != nil {
		return x.Paths
	}
	return nil
}

func (x *IndexSpec) GetRepositories() []*RepoSpec {
	if x != nil {
		return x.Repositories
	}
	return nil
}

type Metadata struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	UrlPattern string   `protobuf:"bytes,1,opt,name=url_pattern,proto3" json:"url_pattern,omitempty"`
	Remote     string   `protobuf:"bytes,2,opt,name=remote,proto3" json:"remote,omitempty"`
	Github     string   `protobuf:"bytes,3,opt,name=github,proto3" json:"github,omitempty"`
	Labels     []string `protobuf:"bytes,4,rep,name=labels,proto3" json:"labels,omitempty"`
}

func (x *Metadata) Reset() {
	*x = Metadata{}
	if protoimpl.UnsafeEnabled {
		mi := &file_config_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *Metadata) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*Metadata) ProtoMessage() {}

func (x *Metadata) ProtoReflect() protoreflect.Message {
	mi := &file_config_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use Metadata.ProtoReflect.Descriptor instead.
func (*Metadata) Descriptor() ([]byte, []int) {
	return file_config_proto_rawDescGZIP(), []int{1}
}

func (x *Metadata) GetUrlPattern() string {
	if x != nil {
		return x.UrlPattern
	}
	return ""
}

func (x *Metadata) GetRemote() string {
	if x != nil {
		return x.Remote
	}
	return ""
}

func (x *Metadata) GetGithub() string {
	if x != nil {
		return x.Github
	}
	return ""
}

func (x *Metadata) GetLabels() []string {
	if x != nil {
		return x.Labels
	}
	return nil
}

type CloneOptions struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Depth       int32  `protobuf:"varint,1,opt,name=depth,proto3" json:"depth,omitempty"`
	Username    string `protobuf:"bytes,2,opt,name=username,proto3" json:"username,omitempty"`
	PasswordEnv string `protobuf:"bytes,3,opt,name=password_env,proto3" json:"password_env,omitempty"`
}

func (x *CloneOptions) Reset() {
	*x = CloneOptions{}
	if protoimpl.UnsafeEnabled {
		mi := &file_config_proto_msgTypes[2]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *CloneOptions) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*CloneOptions) ProtoMessage() {}

func (x *CloneOptions) ProtoReflect() protoreflect.Message {
	mi := &file_config_proto_msgTypes[2]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use CloneOptions.ProtoReflect.Descriptor instead.
func (*CloneOptions) Descriptor() ([]byte, []int) {
	return file_config_proto_rawDescGZIP(), []int{2}
}

func (x *CloneOptions) GetDepth() int32 {
	if x != nil {
		return x.Depth
	}
	return 0
}

func (x *CloneOptions) GetUsername() string {
	if x != nil {
		return x.Username
	}
	return ""
}

func (x *CloneOptions) GetPasswordEnv() string {
	if x != nil {
		return x.PasswordEnv
	}
	return ""
}

type PathSpec struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Path            string    `protobuf:"bytes,1,opt,name=path,proto3" json:"path,omitempty"`
	Name            string    `protobuf:"bytes,2,opt,name=name,proto3" json:"name,omitempty"`
	OrderedContents string    `protobuf:"bytes,3,opt,name=ordered_contents,proto3" json:"ordered_contents,omitempty"`
	Metadata        *Metadata `protobuf:"bytes,4,opt,name=metadata,proto3" json:"metadata,omitempty"`
	IgnoreSymlinks  bool      `protobuf:"varint,5,opt,name=ignore_symlinks,proto3" json:"ignore_symlinks,omitempty"`
}

func (x *PathSpec) Reset() {
	*x = PathSpec{}
	if protoimpl.UnsafeEnabled {
		mi := &file_config_proto_msgTypes[3]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *PathSpec) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*PathSpec) ProtoMessage() {}

func (x *PathSpec) ProtoReflect() protoreflect.Message {
	mi := &file_config_proto_msgTypes[3]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use PathSpec.ProtoReflect.Descriptor instead.
func (*PathSpec) Descriptor() ([]byte, []int) {
	return file_config_proto_rawDescGZIP(), []int{3}
}

func (x *PathSpec) GetPath() string {
	if x != nil {
		return x.Path
	}
	return ""
}

func (x *PathSpec) GetName() string {
	if x != nil {
		return x.Name
	}
	return ""
}

func (x *PathSpec) GetOrderedContents() string {
	if x != nil {
		return x.OrderedContents
	}
	return ""
}

func (x *PathSpec) GetMetadata() *Metadata {
	if x != nil {
		return x.Metadata
	}
	return nil
}

func (x *PathSpec) GetIgnoreSymlinks() bool {
	if x != nil {
		return x.IgnoreSymlinks
	}
	return false
}

type RepoSpec struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Path           string        `protobuf:"bytes,1,opt,name=path,proto3" json:"path,omitempty"`
	Name           string        `protobuf:"bytes,2,opt,name=name,proto3" json:"name,omitempty"`
	Revisions      []string      `protobuf:"bytes,3,rep,name=revisions,proto3" json:"revisions,omitempty"`
	Metadata       *Metadata     `protobuf:"bytes,4,opt,name=metadata,proto3" json:"metadata,omitempty"`
	WalkSubmodules bool          `protobuf:"varint,5,opt,name=walk_submodules,proto3" json:"walk_submodules,omitempty"`
	CloneOptions   *CloneOptions `protobuf:"bytes,6,opt,name=clone_options,proto3" json:"clone_options,omitempty"`
}

func (x *RepoSpec) Reset() {
	*x = RepoSpec{}
	if protoimpl.UnsafeEnabled {
		mi := &file_config_proto_msgTypes[4]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *RepoSpec) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*RepoSpec) ProtoMessage() {}

func (x *RepoSpec) ProtoReflect() protoreflect.Message {
	mi := &file_config_proto_msgTypes[4]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use RepoSpec.ProtoReflect.Descriptor instead.
func (*RepoSpec) Descriptor() ([]byte, []int) {
	return file_config_proto_rawDescGZIP(), []int{4}
}

func (x *RepoSpec) GetPath() string {
	if x != nil {
		return x.Path
	}
	return ""
}

func (x *RepoSpec) GetName() string {
	if x != nil {
		return x.Name
	}
	return ""
}

func (x *RepoSpec) GetRevisions() []string {
	if x != nil {
		return x.Revisions
	}
	return nil
}

func (x *RepoSpec) GetMetadata() *Metadata {
	if x != nil {
		return x.Metadata
	}
	return nil
}

func (x *RepoSpec) GetWalkSubmodules() bool {
	if x != nil {
		return x.WalkSubmodules
	}
	return false
}

func (x *RepoSpec) GetCloneOptions() *CloneOptions {
	if x != nil {
		return x.CloneOptions
	}
	return nil
}

var File_config_proto protoreflect.FileDescriptor

var file_config_proto_rawDesc = []byte{
	0x0a, 0x0c, 0x63, 0x6f, 0x6e, 0x66, 0x69, 0x67, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x22, 0x72,
	0x0a, 0x09, 0x49, 0x6e, 0x64, 0x65, 0x78, 0x53, 0x70, 0x65, 0x63, 0x12, 0x12, 0x0a, 0x04, 0x6e,
	0x61, 0x6d, 0x65, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x04, 0x6e, 0x61, 0x6d, 0x65, 0x12,
	0x22, 0x0a, 0x05, 0x70, 0x61, 0x74, 0x68, 0x73, 0x18, 0x02, 0x20, 0x03, 0x28, 0x0b, 0x32, 0x09,
	0x2e, 0x50, 0x61, 0x74, 0x68, 0x53, 0x70, 0x65, 0x63, 0x52, 0x08, 0x66, 0x73, 0x5f, 0x70, 0x61,
	0x74, 0x68, 0x73, 0x12, 0x2d, 0x0a, 0x0c, 0x72, 0x65, 0x70, 0x6f, 0x73, 0x69, 0x74, 0x6f, 0x72,
	0x69, 0x65, 0x73, 0x18, 0x03, 0x20, 0x03, 0x28, 0x0b, 0x32, 0x09, 0x2e, 0x52, 0x65, 0x70, 0x6f,
	0x53, 0x70, 0x65, 0x63, 0x52, 0x0c, 0x72, 0x65, 0x70, 0x6f, 0x73, 0x69, 0x74, 0x6f, 0x72, 0x69,
	0x65, 0x73, 0x22, 0x74, 0x0a, 0x08, 0x4d, 0x65, 0x74, 0x61, 0x64, 0x61, 0x74, 0x61, 0x12, 0x20,
	0x0a, 0x0b, 0x75, 0x72, 0x6c, 0x5f, 0x70, 0x61, 0x74, 0x74, 0x65, 0x72, 0x6e, 0x18, 0x01, 0x20,
	0x01, 0x28, 0x09, 0x52, 0x0b, 0x75, 0x72, 0x6c, 0x5f, 0x70, 0x61, 0x74, 0x74, 0x65, 0x72, 0x6e,
	0x12, 0x16, 0x0a, 0x06, 0x72, 0x65, 0x6d, 0x6f, 0x74, 0x65, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09,
	0x52, 0x06, 0x72, 0x65, 0x6d, 0x6f, 0x74, 0x65, 0x12, 0x16, 0x0a, 0x06, 0x67, 0x69, 0x74, 0x68,
	0x75, 0x62, 0x18, 0x03, 0x20, 0x01, 0x28, 0x09, 0x52, 0x06, 0x67, 0x69, 0x74, 0x68, 0x75, 0x62,
	0x12, 0x16, 0x0a, 0x06, 0x6c, 0x61, 0x62, 0x65, 0x6c, 0x73, 0x18, 0x04, 0x20, 0x03, 0x28, 0x09,
	0x52, 0x06, 0x6c, 0x61, 0x62, 0x65, 0x6c, 0x73, 0x22, 0x64, 0x0a, 0x0c, 0x43, 0x6c, 0x6f, 0x6e,
	0x65, 0x4f, 0x70, 0x74, 0x69, 0x6f, 0x6e, 0x73, 0x12, 0x14, 0x0a, 0x05, 0x64, 0x65, 0x70, 0x74,
	0x68, 0x18, 0x01, 0x20, 0x01, 0x28, 0x05, 0x52, 0x05, 0x64, 0x65, 0x70, 0x74, 0x68, 0x12, 0x1a,
	0x0a, 0x08, 0x75, 0x73, 0x65, 0x72, 0x6e, 0x61, 0x6d, 0x65, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09,
	0x52, 0x08, 0x75, 0x73, 0x65, 0x72, 0x6e, 0x61, 0x6d, 0x65, 0x12, 0x22, 0x0a, 0x0c, 0x70, 0x61,
	0x73, 0x73, 0x77, 0x6f, 0x72, 0x64, 0x5f, 0x65, 0x6e, 0x76, 0x18, 0x03, 0x20, 0x01, 0x28, 0x09,
	0x52, 0x0c, 0x70, 0x61, 0x73, 0x73, 0x77, 0x6f, 0x72, 0x64, 0x5f, 0x65, 0x6e, 0x76, 0x22, 0xaf,
	0x01, 0x0a, 0x08, 0x50, 0x61, 0x74, 0x68, 0x53, 0x70, 0x65, 0x63, 0x12, 0x12, 0x0a, 0x04, 0x70,
	0x61, 0x74, 0x68, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x04, 0x70, 0x61, 0x74, 0x68, 0x12,
	0x12, 0x0a, 0x04, 0x6e, 0x61, 0x6d, 0x65, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x04, 0x6e,
	0x61, 0x6d, 0x65, 0x12, 0x2a, 0x0a, 0x10, 0x6f, 0x72, 0x64, 0x65, 0x72, 0x65, 0x64, 0x5f, 0x63,
	0x6f, 0x6e, 0x74, 0x65, 0x6e, 0x74, 0x73, 0x18, 0x03, 0x20, 0x01, 0x28, 0x09, 0x52, 0x10, 0x6f,
	0x72, 0x64, 0x65, 0x72, 0x65, 0x64, 0x5f, 0x63, 0x6f, 0x6e, 0x74, 0x65, 0x6e, 0x74, 0x73, 0x12,
	0x25, 0x0a, 0x08, 0x6d, 0x65, 0x74, 0x61, 0x64, 0x61, 0x74, 0x61, 0x18, 0x04, 0x20, 0x01, 0x28,
	0x0b, 0x32, 0x09, 0x2e, 0x4d, 0x65, 0x74, 0x61, 0x64, 0x61, 0x74, 0x61, 0x52, 0x08, 0x6d, 0x65,
	0x74, 0x61, 0x64, 0x61, 0x74, 0x61, 0x12, 0x28, 0x0a, 0x0f, 0x69, 0x67, 0x6e, 0x6f, 0x72, 0x65,
	0x5f, 0x73, 0x79, 0x6d, 0x6c, 0x69, 0x6e, 0x6b, 0x73, 0x18, 0x05, 0x20, 0x01, 0x28, 0x08, 0x52,
	0x0f, 0x69, 0x67, 0x6e, 0x6f, 0x72, 0x65, 0x5f, 0x73, 0x79, 0x6d, 0x6c, 0x69, 0x6e, 0x6b, 0x73,
	0x22, 0xd6, 0x01, 0x0a, 0x08, 0x52, 0x65, 0x70, 0x6f, 0x53, 0x70, 0x65, 0x63, 0x12, 0x12, 0x0a,
	0x04, 0x70, 0x61, 0x74, 0x68, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x04, 0x70, 0x61, 0x74,
	0x68, 0x12, 0x12, 0x0a, 0x04, 0x6e, 0x61, 0x6d, 0x65, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52,
	0x04, 0x6e, 0x61, 0x6d, 0x65, 0x12, 0x1c, 0x0a, 0x09, 0x72, 0x65, 0x76, 0x69, 0x73, 0x69, 0x6f,
	0x6e, 0x73, 0x18, 0x03, 0x20, 0x03, 0x28, 0x09, 0x52, 0x09, 0x72, 0x65, 0x76, 0x69, 0x73, 0x69,
	0x6f, 0x6e, 0x73, 0x12, 0x25, 0x0a, 0x08, 0x6d, 0x65, 0x74, 0x61, 0x64, 0x61, 0x74, 0x61, 0x18,
	0x04, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x09, 0x2e, 0x4d, 0x65, 0x74, 0x61, 0x64, 0x61, 0x74, 0x61,
	0x52, 0x08, 0x6d, 0x65, 0x74, 0x61, 0x64, 0x61, 0x74, 0x61, 0x12, 0x28, 0x0a, 0x0f, 0x77, 0x61,
	0x6c, 0x6b, 0x5f, 0x73, 0x75, 0x62, 0x6d, 0x6f, 0x64, 0x75, 0x6c, 0x65, 0x73, 0x18, 0x05, 0x20,
	0x01, 0x28, 0x08, 0x52, 0x0f, 0x77, 0x61, 0x6c, 0x6b, 0x5f, 0x73, 0x75, 0x62, 0x6d, 0x6f, 0x64,
	0x75, 0x6c, 0x65, 0x73, 0x12, 0x33, 0x0a, 0x0d, 0x63, 0x6c, 0x6f, 0x6e, 0x65, 0x5f, 0x6f, 0x70,
	0x74, 0x69, 0x6f, 0x6e, 0x73, 0x18, 0x06, 0x20, 0x01, 0x28, 0x0b, 0x32, 0x0d, 0x2e, 0x43, 0x6c,
	0x6f, 0x6e, 0x65, 0x4f, 0x70, 0x74, 0x69, 0x6f, 0x6e, 0x73, 0x52, 0x0d, 0x63, 0x6c, 0x6f, 0x6e,
	0x65, 0x5f, 0x6f, 0x70, 0x74, 0x69, 0x6f, 0x6e, 0x73, 0x42, 0x08, 0x5a, 0x06, 0x70, 0x72, 0x6f,
	0x74, 0x6f, 0x2f, 0x62, 0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_config_proto_rawDescOnce sync.Once
	file_config_proto_rawDescData = file_config_proto_rawDesc
)

func file_config_proto_rawDescGZIP() []byte {
	file_config_proto_rawDescOnce.Do(func() {
		file_config_proto_rawDescData = protoimpl.X.CompressGZIP(file_config_proto_rawDescData)
	})
	return file_config_proto_rawDescData
}

var file_config_proto_msgTypes = make([]protoimpl.MessageInfo, 5)
var file_config_proto_goTypes = []interface{}{
	(*IndexSpec)(nil),    // 0: IndexSpec
	(*Metadata)(nil),     // 1: Metadata
	(*CloneOptions)(nil), // 2: CloneOptions
	(*PathSpec)(nil),     // 3: PathSpec
	(*RepoSpec)(nil),     // 4: RepoSpec
}
var file_config_proto_depIdxs = []int32{
	3, // 0: IndexSpec.paths:type_name -> PathSpec
	4, // 1: IndexSpec.repositories:type_name -> RepoSpec
	1, // 2: PathSpec.metadata:type_name -> Metadata
	1, // 3: RepoSpec.metadata:type_name -> Metadata
	2, // 4: RepoSpec.clone_options:type_name -> CloneOptions
	5, // [5:5] is the sub-list for method output_type
	5, // [5:5] is the sub-list for method input_type
	5, // [5:5] is the sub-list for extension type_name
	5, // [5:5] is the sub-list for extension extendee
	0, // [0:5] is the sub-list for field type_name
}

func init() { file_config_proto_init() }
func file_config_proto_init() {
	if File_config_proto != nil {
		return
	}
	if !protoimpl.UnsafeEnabled {
		file_config_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*IndexSpec); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_config_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*Metadata); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_config_proto_msgTypes[2].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*CloneOptions); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_config_proto_msgTypes[3].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*PathSpec); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_config_proto_msgTypes[4].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*RepoSpec); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
	}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: file_config_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   5,
			NumExtensions: 0,
			NumServices:   0,
		},
		GoTypes:           file_config_proto_goTypes,
		DependencyIndexes: file_config_proto_depIdxs,
		MessageInfos:      file_config_proto_msgTypes,
	}.Build()
	File_config_proto = out.File
	file_config_proto_rawDesc = nil
	file_config_proto_goTypes = nil
	file_config_proto_depIdxs = nil
}