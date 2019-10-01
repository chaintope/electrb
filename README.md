# Electrb [![Build Status](https://travis-ci.org/chaintope/electrb.svg?branch=master)](https://travis-ci.org/chaintope/electrb) [![Gem Version](https://badge.fury.io/rb/electrb.svg)](https://badge.fury.io/rb/electrb) [![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)

A pure Ruby Electrum client library. This makes it easy to access electrum services using Ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'electrb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install electrb

## Usage

### JSON-RPC access

Electrum server provides an [API](http://docs.electrum.org/en/latest/protocol.html) to access with JSON-RPC.

`Electrs::Client` can call Electrum's method by replacing `.` to `_` in the method name like follows:

```ruby
require 'electrb'

client = Electrb::Client.new("localhost", 50001)

# get server version
client.request('server.version', ['1.9.5', '0.6'])
=> ["electrs 0.7.0", "1.4"]

# get transaction
txid = 'd513c8fa051336fc8059958a7c99dc390c741a693503b67783392d0a84029bcb' 
client.request('blockchain.transaction.get', txid)
=> '02000000000101592110a2310082589362bc14e5dd5f6baad9705235995594aabacbc5b88e537f01000000171600142fd1a396731d8a4eb616791f7c1799eb6f446aacfeffffff02a5aba1800700000017a9146cfe9a5230d6a30815440ae32afe029f3864634287bcb720000000000017a914c6953679a4a0aeaf71317150b38e5b5cfae76415870247304402203c47f3d32e572bc4b382f2ecebeb34d1254936811d2e778cc107dfe5dc41663c02201a1eb3e73bf8f79578ec921c42436ba36ca95ace830311c26a9d15eb06a28d470121030af582d65f02f1ec50b466dd40bca58378d9117dcf443adaf1b14753a377539e94ea1700'

```
